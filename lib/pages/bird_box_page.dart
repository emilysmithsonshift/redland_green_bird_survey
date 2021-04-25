import 'package:flutter/material.dart';
import 'package:redland_green_bird_survey/model/main_model.dart';
import 'package:redland_green_bird_survey/providers/birdboxes_provider.dart';
import 'package:redland_green_bird_survey/providers/sightings_provider.dart';
import 'package:redland_green_bird_survey/widgets/page_template.dart';
import 'package:redland_green_bird_survey/widgets/rg_grid_tile.dart';

import '../settings.dart';
import '../widgets/observation_widget.dart';
import 'enter_observations_page.dart';

class BirdBoxPage extends StatefulWidget {
  final BirdBox birdBox;

  BirdBoxPage({Key key, this.birdBox}) : super(key: key);

  @override
  _BirdBoxPageState createState() => _BirdBoxPageState();
}

class _BirdBoxPageState extends State<BirdBoxPage> {
  @override
  Widget build(BuildContext context) {
    List<Sighting> _sightingList = [];
    Widget content() {
      _sightingList = sightings
          .where((sighting) => sighting.birdBox == widget.birdBox.id)
          .toList();

      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Row(
            children: [
              Flexible(
                child: Container(
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(8),
                  height: 200,
                  decoration: defaultBoxDecoration(color: Colors.green[50]),
                  child: Column(
                    children: [
                      const Text(
                        'Location',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 12),
                      Text(birdBoxesList[widget.birdBox.id - 1]
                          .locationDescription),
                    ],
                  ),
                ),
              ),
              Flexible(
                child: RGGridTile(
                    heroTag: 'greattit',
                    navigateTo: EnterObservationsPage(
                      birdBox: widget.birdBox.id,
                    ),
                    setState: () {
                      setState(() {});
                    },
                    text: 'Enter your own observations for this box',
                    imageAsset: 'assets/greattit.png'),
              ),
            ],
          ),
          Column(
            children: _sightingList.map((Sighting sighting) {
              return observationDetails(
                  sighting: sighting,
                  context: context,
                  showBoxNo: false,
                  showUser: true);
            }).toList(),
          )
        ]),
      );
    }

    return PageTemplate(
      title: 'Bird Box ${widget.birdBox.id}',
      image: 'assets/bluetit.png',
      widgetList: [content()],
      gridList: [],
      heroTag: 'starling',
    );
  }
}
