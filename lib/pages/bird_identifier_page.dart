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
    List<Bird> nestingBirds = Bird.birdsList
        .where((bird) => bird.birdType == BirdType.nesting)
        .toList();
    List<Bird> predatorBirds = Bird.birdsList
        .where((bird) => bird.birdType == BirdType.predator)
        .toList();
    List<Bird> otherBirds = Bird.birdsList
        .where((bird) => bird.birdType == BirdType.other)
        .toList();

    List<Widget> gridList(List<Bird> birdsList) {
      return birdsList.map((bird) {
        if (bird.images.isEmpty) {
          return Container();
        }
        return Container(
          height: 130,
          width: 130,
          child: RGGridTile(
            navigateTo: BirdFactPage(bird: bird),
            imageAsset: bird.images[0],
            text: bird.name,
            heroTag: '${bird.name}1',
          ),
        );
      }).toList();
    }

    Widget content = Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text(
            'Birds that are likely to nest in the bird boxes',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          Wrap(
            children: gridList(nestingBirds),
            direction: Axis.horizontal,
          ),
          SizedBox(height: 40),
          Text(
            'Birds that are potential predators of eggs or young birds in the bird boxes.',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          Wrap(
            children: gridList(predatorBirds),
            direction: Axis.horizontal,
          ),
          SizedBox(height: 40),
          Text(
            'Other birds you may see on the green',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          Wrap(
            children: gridList(otherBirds),
            direction: Axis.horizontal,
          ),
        ],
      ),
    );

    return PageTemplate(
      title: 'Redland Green Birds',
      image: 'assets/songthrush.png',
      heroTag: 'songthrush',
      widgetList: [content],
      gridList: [],
      size: 200,
    );
  }
}
