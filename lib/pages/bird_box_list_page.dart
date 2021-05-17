import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:redland_green_bird_survey/models/bird_box.dart';
import 'package:redland_green_bird_survey/widgets/bird_box_widget.dart';
import 'package:redland_green_bird_survey/widgets/page_template.dart';

import 'bird_box_page.dart';

class BirdBoxListPage extends StatefulWidget {
  @override
  _BirdBoxListPageState createState() => _BirdBoxListPageState();
}

class _BirdBoxListPageState extends State<BirdBoxListPage> {
  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      size: MediaQuery.of(context).size.width / 3,
      title: 'Bird Box List',
      image: 'assets/jay.png',
      // size: 150,
      gridList: BirdBox.birdBoxesList.map((BirdBox birdBox) {
        return OpenContainer(
          closedColor: Colors.green[100],
          closedBuilder: (context, action) {
            return BirdBoxWidget(
              birdBox: birdBox,
            );
          },
          openBuilder: (context, action) {
            return BirdBoxPage(birdBox: birdBox);
          },
        );
      }).toList(),
      heroTag: 'box_list_page',
    );
  }
}
