import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Sighting {
  String id;
  DateTime dateTime;
  int birdBox;
  int bird;
  String user;
  String userEmail;
  int sightingType;
  String comment;
  int furtherDetailsOption;
  bool fledgling;
  Sighting({
    this.id,
    this.dateTime,
    this.birdBox,
    this.user,
    this.sightingType,
    this.bird,
    this.comment,
    this.userEmail,
    this.furtherDetailsOption,
    this.fledgling,
  });
  static final ValueNotifier<int> observationsNotifier = ValueNotifier<int>(0);
  static final List<Sighting> observations = [];
  static List<Sighting> sightings = [];

  static void addSighting(Sighting _sighting) {
    final DatabaseReference reference =
        FirebaseDatabase.instance.reference().child("observations");
    final String newkey = reference.push().key;
    reference.child(newkey).set({
      'user': _sighting.user,
      'date_time': _sighting.dateTime.toIso8601String(),
      'bird_box': _sighting.birdBox,
      'sighting_type': _sighting.sightingType,
      'bird': _sighting.bird,
      'userEmail': _sighting.userEmail,
      'furtherObservation': _sighting.furtherDetailsOption,
      'fledgling': _sighting.fledgling,
    });
    getSightings();
  }

  static void updateSighting(Sighting _sighting, String id) {
    final DatabaseReference reference =
        FirebaseDatabase.instance.reference().child("observations");
    reference.child(id).update({
      'user': _sighting.user,
      'date_time': _sighting.dateTime.toIso8601String(),
      'bird_box': _sighting.birdBox,
      'sighting_type': _sighting.sightingType,
      'bird': _sighting.bird,
      'userEmail': _sighting.userEmail,
      'furtherObservation': _sighting.furtherDetailsOption,
      'fledgling': _sighting.fledgling ?? false,
    });
    getSightings();
  }

  static Future<bool> getSightings() async {
    final DatabaseReference reference =
        FirebaseDatabase.instance.reference().child("observations");
    final DataSnapshot snapshot = await reference.once();

    observations.clear();
    if (snapshot.value == null) {
      return true;
    }
    final returnedList = snapshot.value;
    returnedList.forEach((key, value) {
      observations.add(
        Sighting(
            id: key as String,
            sightingType: value['sighting_type'] as int,
            dateTime: DateTime.parse(value['date_time'] as String),
            user: value['user'] as String,
            userEmail: value['userEmail'],
            bird: value['bird'],
            furtherDetailsOption: value['furtherObservation'] as int,
            birdBox: value['bird_box'] as int,
            fledgling: value['fledgling'] as bool),
      );
    });
    observations
        .sort((Sighting a, Sighting b) => b.dateTime.compareTo(a.dateTime));
    sightings = observations.where((sighting) => sighting.bird != 0).toList();
    observationsNotifier.value++;
    return true;
  }
}
