import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:redland_green_bird_survey/model/main_model.dart';
import 'package:redland_green_bird_survey/pages/bird_box_page.dart';
import 'package:redland_green_bird_survey/pages/bird_fact_page.dart';
import 'package:redland_green_bird_survey/pages/enter_observations_page.dart';
import 'package:redland_green_bird_survey/providers/birdboxes_provider.dart';
import 'package:redland_green_bird_survey/providers/sightings_provider.dart';

Widget observationDetails({
  Sighting sighting,
  BuildContext context,
  bool showBoxNo,
  bool showUser,
  Function setState,
}) {
  UniqueKey heroKey = UniqueKey();
  return Stack(
    children: [
      Container(
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
        padding: showUser
            ? EdgeInsets.all(8)
            : EdgeInsets.only(top: 24, bottom: 24, left: 8, right: 8),
        margin: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BirdFactPage(
                      bird: sighting.bird,
                      heroKey: heroKey.toString(),
                    ),
                  ),
                );
              },
              child: Hero(
                tag: heroKey.toString(),
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
                        : Image.asset(sighting.bird.image[0],
                            fit: BoxFit.fitHeight),
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
                    if (showUser)
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
                      builder: (_) => BirdBoxPage(
                          birdBox: birdBoxesList[sighting.birdBox - 1]),
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
      ),
      if (!showUser)
        Align(
          alignment: Alignment.bottomRight,
          child: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => EnterObservationsPage(
                    sighting: sighting,
                  ),
                ),
              );
            },
            icon: Icon(
              Icons.edit,
              color: Colors.grey,
            ),
          ),
        ),
      if (!showUser)
        Positioned(
          bottom: 0,
          right: 0,
          child: IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(
                        'Are you sure you want to delete this observation?'),
                    actions: [
                      ElevatedButton(
                        onPressed: () async {
                          final DatabaseReference reference = FirebaseDatabase
                              .instance
                              .reference()
                              .child("observations");
                          await reference.child(sighting.id).remove();
                          Navigator.pop(context);
                          await getSightings();
                          setState();
                        },
                        child: const Text('Delete'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel'),
                      ),
                    ],
                  );
                  ;
                },
              );
            },
            icon: Icon(
              Icons.delete,
              color: Colors.grey,
            ),
          ),
        ),
    ],
  );
}
