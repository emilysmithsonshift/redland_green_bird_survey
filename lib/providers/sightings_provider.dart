import 'package:firebase_database/firebase_database.dart';
import 'package:redland_green_bird_survey/model/main_model.dart';
import 'package:redland_green_bird_survey/providers/sightings_type_provider.dart';

import 'birds_provider.dart';

final List<Sighting> sightings = [
  // Sighting(
  //   id: '0',
  //   dateTime: DateTime(
  //     2020,
  //     12,
  //     07,
  //     12,
  //     34,
  //     21,
  //     32,
  //   ),
  //   birdBox: 0,
  //   user: 'Emily',
  //   sightingType: SightingsType.sightingsTypeList[1],
  //   bird: Birds.nuthatch,
  // ),
  // Sighting(
  //   id: '0',
  //   dateTime: DateTime(
  //     2020,
  //     12,
  //     07,
  //     12,
  //     34,
  //     21,
  //     32,
  //   ),
  //   birdBox: 0,
  //   user: 'Emily',
  //   sightingType: SightingsType.sightingsTypeList[1],
  //   bird: Birds.nuthatch,
  // ),
  // Sighting(
  //   id: '0',
  //   dateTime: DateTime(
  //     2020,
  //     12,
  //     07,
  //     12,
  //     34,
  //     21,
  //     32,
  //   ),
  //   birdBox: 0,
  //   user: 'Emily',
  //   sightingType: SightingsType.sightingsTypeList[1],
  //   bird: Birds.nuthatch,
  // ),
  // Sighting(
  //   id: '0',
  //   dateTime: DateTime(
  //     2020,
  //     12,
  //     07,
  //     12,
  //     34,
  //     21,
  //     32,
  //   ),
  //   birdBox: 0,
  //   user: 'Emily',
  //   sightingType: SightingsType.sightingsTypeList[1],
  //   bird: Birds.nuthatch,
  // ),
];
void addSighting(Sighting _sighting) {
  final DatabaseReference reference =
      FirebaseDatabase.instance.reference().child("observations");
  final String newkey = reference.push().key;
  reference.child(newkey).set({
    'user': 'Bob',
    'date_time': _sighting.dateTime.toIso8601String(),
    'bird_box': _sighting.birdBox,
    'sighting_type': _sighting.sightingType.id,
    'bird': _sighting.bird.name,
  });
}

void getSightings() {
  final DatabaseReference reference =
      FirebaseDatabase.instance.reference().child("observations");
  reference.once().then((DataSnapshot snapshot) {
    final returnedList = snapshot.value;
    returnedList.forEach((key, value) {
      sightings.add(
        Sighting(
            id: key as String,
            sightingType: sightingsTypeList[value['sighting_type'] as int],
            dateTime: DateTime.parse(value['date_time'] as String),
            user: value['user'] as String,
            bird: birdsList.firstWhere((bird) {
              return bird.name == value['bird'];
            }),
            birdBox: value['bird_box'] as int),
      );
    });
  });
}
