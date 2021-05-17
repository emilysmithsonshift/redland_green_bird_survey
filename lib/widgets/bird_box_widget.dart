import 'package:flutter/material.dart';
import 'package:redland_green_bird_survey/models/bird_box.dart';

import '../settings.dart';

class BirdBoxWidget extends StatelessWidget {
  final BirdBox birdBox;

  const BirdBoxWidget({Key key, this.birdBox}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: defaultBoxDecoration(color: Colors.green[50]),
      padding: EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      child: AspectRatio(
        aspectRatio: 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: FittedBox(
                  child: ClipOval(
                    child: Image.asset(birdBox.boxType.image),
                  ),
                ),
              ),
            ),
            FittedBox(
              child: Text('Bird Box ${birdBox.id.toString()}',
                  style: Theme.of(context).textTheme.headline2),
            ),
          ],
        ),
      ),
    );
  }
}
