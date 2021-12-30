import 'package:flutter/material.dart';
import 'package:redland_green_bird_survey/models/bird_box.dart';
import 'package:redland_green_bird_survey/settings.dart';
import 'package:redland_green_bird_survey/widgets/bird_box_widget.dart';
import 'package:redland_green_bird_survey/widgets/page_template.dart';

import 'bird_box_page.dart';

class BirdBoxListPage extends StatefulWidget {
  const BirdBoxListPage({Key? key}) : super(key: key);

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
            margin: const EdgeInsets.all(8),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BirdBoxPage(
                      birdBox: birdBox,
                    ),
                  ),
                );
              },
              child: BirdBoxWidget(
                birdBox: birdBox,
              ),
            ));
      }).toList(),
      heroTag: 'bird_box_list',
    );
  }
}
