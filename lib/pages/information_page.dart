import 'package:flutter/material.dart';
import 'package:redland_green_bird_survey/pages/enter_observations_page.dart';
import 'package:redland_green_bird_survey/pages/map_page.dart';
import 'package:redland_green_bird_survey/widgets/page_template.dart';

import '../settings.dart';

class InformationPage extends StatefulWidget {
  @override
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
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
                '\n\nThere has been a massive decline in bird species in the UK with up to a quarter of all species '
                'endangered. Installing bird boxes is one of the best ways of protecting birdlife from predators.'
                '\n\nIn 2020 Redland Green Community Group installed 16 bird nesting boxes all around the green thanks'
                ' to a generous grant from RCAS.'
                '\n\nIn early 2021 these boxes were cleaned out and \b7 were found to have completed nests in and 3 '
                'had partial nests. All were inhabited by blue tits or great tits.'
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
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
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
                        'Only enter an empty observation if you have waited for at least 5 minutes\n'),
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
                        '3. Enter your observation into the app',
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
                )),
            Text(
              '\nEnormous thanks to local photographer Giorgio Pede for letting us use his beautiful photos.',
            )
          ],
        ),
      ),
    ];
    return PageTemplate(
      title: 'Information',
      image: 'assets/bluetit.png',
      heroTag: 'bluetit',
      widgetList: _widgetList,
    );
  }
}
