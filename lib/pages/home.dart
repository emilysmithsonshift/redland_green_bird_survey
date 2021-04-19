import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:redland_green_bird_survey/model/main_model.dart';
import 'package:redland_green_bird_survey/pages/information_screen.dart';
import 'package:redland_green_bird_survey/providers/sightings_provider.dart';
import 'package:redland_green_bird_survey/widgets/page_template.dart';
import 'package:redland_green_bird_survey/widgets/rg_grid_tile.dart';
import 'package:redland_green_bird_survey/widgets/rg_list_tile.dart';

import 'bird_identifier.dart';
import 'enter_observations_screen.dart';
import 'latest_observations.dart';
import 'map_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // for (int i = 0; i < SightingsProvider.sightings.length; i++) {
    //   SightingsProvider.addSighting(SightingsProvider.sightings[i]);
    // }
    getSightings();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _gridList = [
      RGGridTile(
          heroTag: 'nuthatch',
          navigateTo: BirdIdentifierScreen(),
          text: 'Identify birds on the green',
          imageAsset: 'assets/nuthatch.png'),
      RGGridTile(
          heroTag: 'greattit',
          navigateTo: EnterObservationsScreen(),
          text: 'Enter your own observations ',
          imageAsset: 'assets/greattit.png'),
      RGGridTile(
          heroTag: 'map_page',
          navigateTo: MapPage(),
          text: 'Map',
          imageAsset: 'assets/greattit.png'),
    ];
    Widget observationSummary(Sighting sighting) {
      return Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(width: 8),
            Column(
              children: [
                Text(
                  sighting.bird.name ?? 'hi',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  '${DateFormat('d MMM yyyy').format(sighting.dateTime)}  ${DateFormat.jm().format(sighting.dateTime)}',
                ),
              ],
            ),
            Card(
                child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(sighting.birdBox.toString()),
            ))
          ],
        ),
      );
    }

    final List<Widget> _widgetList = [
      RGListTile(
        navigateTo: InformationScreen(),
        imageAsset: 'assets/bluetit.png',
        heroTag: 'bluetit',
        imageLeft: false,
        widget: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: const [
              Center(
                child: Text(
                  'Welcome to the Redland Green Bird Box Survey!\n',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                  'In 2018 Redland Green Community Group installed 20 bird boxes all around the green. '
                  '\n\nTap for more information.')
            ],
          ),
        ),
      ),
      RGListTile(
        imageAsset: 'assets/wagtail.png',
        alignment: Alignment.centerLeft,
        navigateTo: LatestObservationsScreen(),
        heroTag: 'wagtail',
        imageLeft: true,
        widget: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Center(
                child: Text(
                  'Latest Observations',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: Wrap(
                spacing: 8.0, // gap between adjacent chips
                runSpacing: 4.0,
                children: sightings.map((sighting) {
                  return observationSummary(sighting);
                }).toList(),
              ),
            )
          ],
        ),
      ),
    ];

    return Scaffold(
      body: PageTemplate(
        title: 'Redland Green Bird Survey',
        image: 'assets/robin1.png',
        widgetList: _widgetList,
        gridList: _gridList,
        heroTag: 'robin1',
      ),
    );
  }
}
