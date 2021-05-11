import 'package:flutter/material.dart';
import 'package:redland_green_bird_survey/widgets/page_template.dart';

class TempPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      title: 'Redland Green Bird Survey',
      image: 'assets/bluetit4.png',
      heroTag: 'temp',
      widgetList: [
        SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.75,
            child: Center(
                child: Text(
              'Welcome, please be patient while the app loads.',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            )))
      ],
    );
  }
}
