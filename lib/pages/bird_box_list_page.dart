import 'package:flutter/material.dart';
import 'package:redland_green_bird_survey/models/bird_box.dart';
import 'package:redland_green_bird_survey/widgets/bird_box_widget.dart';
import 'package:redland_green_bird_survey/widgets/page_template.dart';

class BirdBoxListPage extends StatefulWidget {
  @override
  _BirdBoxListPageState createState() => _BirdBoxListPageState();
}

class _BirdBoxListPageState extends State<BirdBoxListPage> {
  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      title: 'Bird Box List',
      image: 'assets/nuthatch.png',
      widgetList: BirdBox.birdBoxesList.map((BirdBox birdBox) {
        return BirdBoxWidget(
          birdBox: birdBox,
          context: context,
        );
      }).toList(),
      gridList: [],
      heroTag: 'box_list_page',
    );
  }
}
