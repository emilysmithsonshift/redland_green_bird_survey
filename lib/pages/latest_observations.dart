import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:redland_green_bird_survey/model/main_model.dart';
import 'package:redland_green_bird_survey/providers/sightings_provider.dart';
import 'package:redland_green_bird_survey/widgets/page_template.dart';

class LatestObservationsScreen extends StatefulWidget {
  @override
  _LatestObservationsScreenState createState() =>
      _LatestObservationsScreenState();
}

class _LatestObservationsScreenState extends State<LatestObservationsScreen> {
  Widget observationDetails(Sighting sighting) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ClipOval(
            child: SizedBox(
              height: 70,
              width: 70,
              child: sighting.bird.image.length == 0
                  ? Container(
                      color: sighting.bird.name == 'None'
                          ? Colors.grey[400]
                          : Colors.white,
                      child: Center(
                        child: Text(
                          sighting.bird.name == 'None' ? '' : '?',
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                    )
                  : Image.asset(sighting.bird.image[0], fit: BoxFit.fitHeight),
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    sighting.bird.name ?? 'None',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    DateFormat('d MMMM yyyy').format(sighting.dateTime) +
                        ' ' +
                        DateFormat.jm().format(sighting.dateTime),
                  ),
                  SizedBox(height: 4),
                  Text(
                    sighting.sightingType.description,
                  ),
                  SizedBox(height: 4),
                  Text('Observed by: ${sighting.user}',
                      style: TextStyle(fontWeight: FontWeight.bold))
                ],
              ),
            ),
          ),
          ClipOval(
            child: Container(
                color: Colors.green[50],
                height: 70,
                width: 70,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Center(
                    child: Text(
                      'Box no:\n' + sighting.birdBox.toString(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final widgetList = [
      Hero(
        tag: 'observations',
        child: Column(
          children: [
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
            Column(
              children: SightingsProvider.sightings.map((sighting) {
                return observationDetails(sighting);
              }).toList(),
            )
          ],
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
