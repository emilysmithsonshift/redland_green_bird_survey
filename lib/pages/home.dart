import 'package:flutter/material.dart';
import 'package:redland_green_bird_survey/pages/information_screen.dart';
import 'package:redland_green_bird_survey/widgets/page_template.dart';
import 'package:redland_green_bird_survey/widgets/rg_grid_tile.dart';
import 'package:redland_green_bird_survey/widgets/rg_list_tile.dart';

import 'bird_identifier.dart';
import 'enter_observations_screen.dart';
import 'latest_observations.dart';

class HomePage extends StatefulWidget {
  const HomePage({key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    ];
    final Widget observation = Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(width: 8),
          Column(
            children: [
              Text(
                'Blue Tit',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('26th Feb 8.03pm'),
            ],
          ),
          Card(
              child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text('Birdbox: 8'),
          ))
        ],
      ),
    );
    final List<Widget> _widgetList = [
      RGListTile(
        navigateTo: InformationScreen(),
        imageAsset: 'assets/bluetit.png',
        heroTag: 'bluetit',
        imageLeft: false,
        widget: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
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
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: Row(
                  children: [
                    Text(
                      'Latest Observations',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            observation,
            observation,
            observation,
          ],
        ),
      ),
    ];

    return PageTemplate(
      title: 'Redland Green Bird Survey',
      image: 'assets/robin1.png',
      widgetList: _widgetList,
      gridList: _gridList,
      heroTag: 'robin1',
    );
  }
}
