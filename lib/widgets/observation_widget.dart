import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:redland_green_bird_survey/models/bird_box.dart';
import 'package:redland_green_bird_survey/models/birds.dart';
import 'package:redland_green_bird_survey/models/further_details_options.dart';
import 'package:redland_green_bird_survey/models/sighting.dart';
import 'package:redland_green_bird_survey/models/sighting_type.dart';
import 'package:redland_green_bird_survey/pages/bird_box_page.dart';
import 'package:redland_green_bird_survey/pages/bird_fact_page.dart';
import 'package:redland_green_bird_survey/pages/enter_observations_page.dart';

Widget observationDetails({
  Sighting sighting,
  BuildContext context,
  bool showBoxNo,
  bool showUser,
  Function setState,
}) {
  Bird bird = Bird.birdsList.firstWhere((bird) => sighting.bird == bird.id);

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
                      bird: bird,
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
                    child: bird.images.isEmpty
                        ? Container(
                            color: bird.name == 'None'
                                ? Colors.grey[400]
                                : Colors.white,
                            child: Center(
                              child: Text(
                                bird.name == 'None' ? '' : '?',
                                style: const TextStyle(fontSize: 30),
                              ),
                            ),
                          )
                        : Image.asset(bird.images[0], fit: BoxFit.fitHeight),
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
                      bird.name ?? 'No bird seen.',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${DateFormat('d MMMM yyyy').format(sighting.dateTime)} ${DateFormat.jm().format(sighting.dateTime)}',
                    ),
                    const SizedBox(height: 4),
                    Text(
                      SightingType.sightingsTypeList
                          .firstWhere((sightingType) =>
                              sightingType.id == sighting.sightingType)
                          .description,
                    ),
                    if (sighting.furtherDetailsOption != -1 &&
                        sighting.furtherDetailsOption != 0)
                      SizedBox(height: 4),
                    if (sighting.furtherDetailsOption != -1 &&
                        sighting.furtherDetailsOption != 0)
                      Text(
                        FurtherDetailsOptions.furtherDetailsOptionsList
                            .firstWhere(
                              (furtherDetails) =>
                                  furtherDetails.id ==
                                  sighting.furtherDetailsOption,
                            )
                            .description,
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
                          birdBox: BirdBox.birdBoxesList[sighting.birdBox - 1]),
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
                          await Sighting.getSightings();
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
