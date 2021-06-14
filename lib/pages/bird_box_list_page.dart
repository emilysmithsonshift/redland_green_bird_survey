import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:redland_green_bird_survey/models/bird_box.dart';
import 'package:redland_green_bird_survey/settings.dart';
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
      gridList: BirdBox.birdBoxesList.map((BirdBox birdBox) {
        return Container(
          decoration: defaultBoxDecoration(),
          margin: EdgeInsets.all(8),
          child: OpenContainer(
            transitionDuration: Duration(milliseconds: 750),
            closedShape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            closedColor: Colors.green[50],
            closedBuilder: (context, action) {
              return BirdBoxWidget(
                birdBox: birdBox,
              );
            },
            openBuilder: (context, action) {
              return BirdBoxPage(birdBox: birdBox);
            },
          ),
        );
      }).toList(),
      heroTag: 'bird_box_list',
    );
  }
}
