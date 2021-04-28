import 'package:flutter/material.dart';
import 'package:redland_green_bird_survey/models/bird_box.dart';
import 'package:redland_green_bird_survey/models/sighting.dart';
import 'package:redland_green_bird_survey/pages/bird_box_type_page.dart';
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
      _sightingList = Sighting.sightings
          .where((sighting) => sighting.birdBox == widget.birdBox.id)
          .toList();

      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(16),
            // height: 100,
            decoration: defaultBoxDecoration(color: Colors.green[50]),
            child: Column(
              children: [
                const Text(
                  'Location',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                Text(BirdBox
                    .birdBoxesList[widget.birdBox.id - 1].locationDescription),
              ],
            ),
          ),
          SizedBox(
            height: 240,
            width: double.infinity,
            child: Row(
              children: [
                Flexible(
                  child: RGGridTile(
                    heroTag: 'greattit',
                    navigateTo: EnterObservationsPage(
                      birdBox: widget.birdBox.id,
                    ),
                    setState: () {
                      setState(() {});
                    },
                    text: 'Enter observations for this box',
                    imageAsset: 'assets/greattit.png',
                  ),
                ),
                Flexible(
                  child: RGGridTile(
                    heroTag: 'boxType',
                    navigateTo:
                        BirdBoxTypePage(boxType: widget.birdBox.boxType),
                    text: 'BoxType: ${widget.birdBox.boxType.name}',
                    imageAsset: widget.birdBox.boxType.image,
                  ),
                ),
              ],
            ),
          ),
          _sightingList.isEmpty
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'No observations have been made for this bird box yet.'
                    '\n\nTo enter one, tap the button above.',
                  ),
                )
              : Column(
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
