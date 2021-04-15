import 'package:flutter/material.dart';
import 'package:redland_green_bird_survey/widgets/page_template.dart';

class LatestObservationsScreen extends StatefulWidget {
  @override
  _LatestObservationsScreenState createState() =>
      _LatestObservationsScreenState();
}

class _LatestObservationsScreenState extends State<LatestObservationsScreen> {
  final Widget observation = Padding(
    padding: EdgeInsets.all(8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ClipOval(
          child: SizedBox(
            width: 30,
            height: 30,
            child: Image.asset('assets/bluetit1.png', fit: BoxFit.fill),
          ),
        ),
        SizedBox(width: 8),
        Column(
          children: [
            Text(
              'Blue Tit',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('26th February 8pm'),
          ],
        ),
        Card(
            child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text('Birdbox: 8'),
        ))
      ],
    ),
  );
  @override
  Widget build(BuildContext context) {
    final widgetList = [
      Hero(
        tag: 'observations',
        child: Container(
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
            color: Colors.green[50],
            border: Border.all(width: 0.3, color: Colors.grey),
            boxShadow: [
              new BoxShadow(
                color: Colors.grey,
                offset: new Offset(5.0, 5.0),
                blurRadius: 5.0,
              )
            ],
          ),
          child: Column(
            children: [
              Icon(Icons.horizontal_rule),
              SizedBox(
                height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Latest',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text('My Obs',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 18,
                        )),
                  ],
                ),
              ),
              observation,
              observation,
              observation,
              observation,
              observation,
            ],
          ),
        ),
      )
    ];
    return PageTemplate(
      title: 'Latest Observations',
      image: 'assets/wagtail.png',
      heroTag: 'wagtail',
      widgetList: widgetList,
    );
  }
}
