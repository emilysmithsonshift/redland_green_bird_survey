import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:redland_green_bird_survey/model/main_model.dart';
import 'package:redland_green_bird_survey/pages/bird_box_page.dart';
import 'package:redland_green_bird_survey/pages/bird_fact_page.dart';
import 'package:redland_green_bird_survey/providers/birdboxes_provider.dart';

Widget observationDetails(
    Sighting sighting, BuildContext context, bool showBoxNo) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.green[50],
      borderRadius: BorderRadius.circular(10),
      boxShadow: const [
        BoxShadow(
          color: Colors.grey,
          offset: Offset(5.0, 5.0),
          blurRadius: 5.0,
        )
      ],
    ),
    padding: const EdgeInsets.all(8),
    margin: const EdgeInsets.all(8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BirdFactPage(bird: sighting.bird),
              ),
            );
          },
          child: ClipOval(
            child: SizedBox(
              height: 70,
              width: 70,
              child: sighting.bird.image.isEmpty
                  ? Container(
                      color: sighting.bird.name == 'None'
                          ? Colors.grey[400]
                          : Colors.white,
                      child: Center(
                        child: Text(
                          sighting.bird.name == 'None' ? '' : '?',
                          style: const TextStyle(fontSize: 30),
                        ),
                      ),
                    )
                  : Image.asset(sighting.bird.image[0], fit: BoxFit.fitHeight),
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
                  sighting.bird.name ?? 'None',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  '${DateFormat('d MMMM yyyy').format(sighting.dateTime)} ${DateFormat.jm().format(sighting.dateTime)}',
                ),
                const SizedBox(height: 4),
                Text(
                  sighting.sightingType.description,
                ),
                const SizedBox(height: 4),
                Text('Observed by: ${sighting.user}',
                    style: const TextStyle(fontWeight: FontWeight.bold))
              ],
            ),
          ),
        ),
        if (showBoxNo)
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      BirdBoxPage(birdBox: birdBoxesList[sighting.birdBox]),
                ),
              );
            },
            child: ClipOval(
              child: Container(
                  color: Colors.green[100],
                  height: 70,
                  width: 70,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Center(
                      child: Text(
                        'Box no:\n${sighting.birdBox}',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )),
            ),
          )
      ],
    ),
  );
}
