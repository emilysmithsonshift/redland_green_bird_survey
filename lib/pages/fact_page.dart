import 'package:flutter/material.dart';
import 'package:redland_green_bird_survey/widgets/page_template.dart';

class FactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      title: 'Fact Page',
      image: 'assets/wren3.png',
      widgetList: [Text('')],
      heroTag: 'fact_page',
    );
  }
}
