import 'package:flutter/material.dart';
import 'package:redland_green_bird_survey/pages/bird_fact_page.dart';
import 'package:redland_green_bird_survey/providers/birds_provider.dart';
import 'package:redland_green_bird_survey/widgets/page_template.dart';
import 'package:redland_green_bird_survey/widgets/rg_grid_tile.dart';

class BirdIdentifierScreen extends StatefulWidget {
  @override
  _BirdIdentifierScreenState createState() => _BirdIdentifierScreenState();
}

class _BirdIdentifierScreenState extends State<BirdIdentifierScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> _gridList = birdsList.map((bird) {
      if (bird.image.isEmpty) {
        return Container();
      }
      return RGGridTile(
        navigateTo: BirdFactPage(bird: bird),
        imageAsset: bird.image[0],
        text: bird.name,
        heroTag: '${bird.name}1',
      );
    }).toList();
    final List<Widget> _widgetList = [];

    return PageTemplate(
      title: 'Identify Birds on the Green',
      image: 'assets/nuthatch.png',
      heroTag: 'nuthatch',
      widgetList: _widgetList,
      gridList: _gridList,
      crossAxisCount: 3,
    );
  }
}
