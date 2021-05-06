import 'package:flutter/material.dart';
import 'package:redland_green_bird_survey/models/birds.dart';
import 'package:redland_green_bird_survey/widgets/page_template.dart';
import 'package:redland_green_bird_survey/widgets/rg_grid_tile.dart';

import 'bird_fact_page.dart';

class BirdIdentifierScreen extends StatefulWidget {
  @override
  _BirdIdentifierScreenState createState() => _BirdIdentifierScreenState();
}

class _BirdIdentifierScreenState extends State<BirdIdentifierScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> _gridList = Bird.birdsList.map((bird) {
      if (bird.images.isEmpty) {
        return Container();
      }
      return RGGridTile(
        navigateTo: BirdFactPage(bird: bird),
        imageAsset: bird.images[0],
        text: bird.name,
        heroTag: '${bird.name}1',
      );
    }).toList();
    final List<Widget> _widgetList = [];

    return PageTemplate(
      title: 'Identify Birds on the Green',
      image: 'assets/songthrush.png',
      heroTag: 'songthrush',
      widgetList: _widgetList,
      gridList: _gridList,
      size: 200,
    );
  }
}
