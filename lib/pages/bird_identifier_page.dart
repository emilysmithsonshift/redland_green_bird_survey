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

    Widget gridList(List<Bird> birdsList) {
      return GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 160,
            childAspectRatio: 1,
          ),
          itemCount: birdsList.length,
          itemBuilder: (context, index) {
            if (birdsList[index].images.isEmpty) {
              return Container();
            }
            return Container(
              height: 130,
              width: 130,
              child: RGGridTile(
                navigateTo: BirdFactPage(bird: birdsList[index]),
                imageAsset: birdsList[index].images[0],
                text: birdsList[index].name,
                heroTag: '${birdsList[index].name}1',
              ),
            );
          });
    }

    Widget content = Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8),
          Text('Birds that are likely to nest in the bird boxes',
              style: Theme.of(context).textTheme.headline2),
          gridList(nestingBirds),
          SizedBox(height: 24),
          Text(
              'Birds that are potential predators of eggs or young birds in the bird boxes.',
              style: Theme.of(context).textTheme.headline2),
          gridList(predatorBirds),
          SizedBox(height: 24),
          Text('Some of the other birds that you may see on the green',
              style: Theme.of(context).textTheme.headline2),
          gridList(otherBirds),
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
