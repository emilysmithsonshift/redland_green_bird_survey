import 'package:firebase_database/firebase_database.dart';

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
  });
  static final List<Sighting> sightings = [];

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
    });
  }

  static Future<bool> getSightings() async {
    final DatabaseReference reference =
        FirebaseDatabase.instance.reference().child("observations");
    final DataSnapshot snapshot = await reference.once();

    sightings.clear();
    if (snapshot.value == null) {
      return true;
    }
    final returnedList = snapshot.value;
    returnedList.forEach((key, value) {
      sightings.add(
        Sighting(
            id: key as String,
            sightingType: value['sighting_type'] as int,
            dateTime: DateTime.parse(value['date_time'] as String),
            user: value['user'] as String,
            userEmail: value['userEmail'],
            bird: value['bird'],
            furtherDetailsOption: value['furtherObservation'] as int,
            birdBox: value['bird_box'] as int),
      );

      sightings
          .sort((Sighting a, Sighting b) => b.dateTime.compareTo(a.dateTime));
    });
    return true;
  }
}
