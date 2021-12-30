import 'package:flutter/material.dart';
import 'package:redland_green_bird_survey/pages/enter_observations_page.dart';
import 'package:redland_green_bird_survey/pages/map_page.dart';
import 'package:redland_green_bird_survey/widgets/page_template.dart';

import '../settings.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> _widgetList = [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('Welcome to the Redland Green Bird Box Survey',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline1),
            Text(
                '\nIn 2020, Redland Green Community Group erected 16 nest boxes in trees around the green.'
                '\n\nThis app is designed to use community power to help monitor these bird boxes.\n'),
            Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(8),
              decoration: defaultBoxDecoration(color: Colors.green[50]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Helping out is as easy as 1 2 3\n',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => MapPage()));
                    },
                    child: Text(
                      '1. Find a bird Box',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => MapPage()));
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            'Use the map to help you locate one of the 16 boxes around the Green.\n',
                          ),
                        ),
                        Icon(Icons.navigate_next),
                      ],
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '2. Observe',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                      'Build your observation record from the activity options provided.\n'),
                  SizedBox(height: 8),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => EnterObservationsPage(),
                        ),
                      );
                    },
                    child: Text(
                      '3. Enter your observation into the app.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => EnterObservationsPage(),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Expanded(
                            child: Text('It is quick and easy'),
                          ),
                          Icon(Icons.navigate_next),
                        ],
                      )),
                  SizedBox(height: 8),
                ],
              ),
            ),
            SizedBox(height: 12),
            Text(
                'There has been a substantial decline in birds (both population numbers and ranges) in the British Isles '
                'since the end of the second world war, a decline which is still continuing in many species. '
                '\n\nInstalling bird boxes is one way to help cavity-nesting species: nest boxes provide substitutes '
                'for natural nesting sites and can offer protection from predators. '
                'We have chosen nest boxes which have a long life and are resistant to damage by predators.\n\n'),
            SizedBox(height: 20),
          ],
        ),
      ),
    ];
    return PageTemplate(
      title: 'Information',
      image: 'assets/bluetit.png',
      heroTag: 'welcome',
      widgetList: _widgetList,
    );
  }
}
