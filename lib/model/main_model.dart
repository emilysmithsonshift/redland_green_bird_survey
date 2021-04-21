import 'package:latlong/latlong.dart';

class BoxType {
  String name;
  String description;
  String icon;
  String image;
  BoxType(this.name, this.description, this.icon, this.image);
}

class BirdBox {
  int id;
  LatLng location;
  String locationDescription;
  BoxType boxType;
  BirdBox(this.id, this.location, this.boxType, this.locationDescription);
}

class Bird {
  String name;
  String description;
  List<String> image;
  Bird(this.name, this.description, this.image);
}

class BirdBoxUser {
  String name;
  String nickname;
  String email;
  bool permission;
  BirdBoxUser({
    this.name,
    this.nickname,
    this.email,
    this.permission,
  });
}

class Sighting {
  String id;
  DateTime dateTime;
  int birdBox;
  Bird bird;
  String user;
  SightingType sightingType;
  Sighting(
      {this.id,
      this.dateTime,
      this.birdBox,
      this.user,
      this.sightingType,
      this.bird});
}

class SightingType {
  int id;
  String description;
  SightingType(
    this.id,
    this.description,
  );
}
