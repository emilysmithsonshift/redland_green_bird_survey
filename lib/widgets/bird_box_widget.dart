import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:redland_green_bird_survey/models/bird_box.dart';
import 'package:redland_green_bird_survey/models/birds.dart';
import 'package:redland_green_bird_survey/models/sighting.dart';
import 'package:redland_green_bird_survey/pages/bird_box_page.dart';
import 'package:redland_green_bird_survey/pages/map_page.dart';

Widget BirdBoxWidget({
  BirdBox birdBox,
  BuildContext context,
}) {
  Sighting _latestObservation;
  _latestObservation = Sighting.sightings.firstWhere(
      (Sighting sighting) => sighting.birdBox == birdBox.id,
      orElse: () => null);

  Sighting _latestSighting;

  _latestSighting = Sighting.sightings.firstWhere(
      (Sighting sighting) =>
          (sighting.birdBox == birdBox.id && sighting.sightingType != 0),
      orElse: () => null);
  return GestureDetector(
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
    child: Container(
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(5.0, 5.0),
            blurRadius: 5.0,
          ),
        ],
      ),
      padding: EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ClipOval(
            child: Container(
              height: 50,
              width: 50,
              color: Colors.green[100],
              child: Center(
                child: Text(
                  birdBox.id.toString(),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Last Observation:',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  _latestObservation == null
                      ? Text('No observations have been recorded')
                      : Text(
                          '${DateFormat('d MMM').format(_latestObservation.dateTime)} ${DateFormat.jm().format(_latestObservation.dateTime)}'
                          ' ${Bird.birdsList.firstWhere((bird) => _latestObservation.bird == bird.id).name}',
                        ),
                  const SizedBox(height: 12),
                  Text(
                    'Latest sighting:',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  _latestSighting == null
                      ? Text('No sightings have been recorded')
                      : Text(
                          '${DateFormat('d MMM').format(_latestSighting.dateTime)}  ${DateFormat.jm().format(_latestSighting.dateTime)}'
                          ' ${Bird.birdsList.firstWhere((bird) => _latestObservation.bird == bird.id).name}',
                        ),
                ],
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.map_rounded),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MapPage(),
                ),
              );
            },
          )
        ],
      ),
    ),
  );
}
