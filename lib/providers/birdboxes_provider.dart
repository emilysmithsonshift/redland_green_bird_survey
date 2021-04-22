import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:redland_green_bird_survey/model/main_model.dart';

import 'birdboxtype_provider.dart';

final BirdBox birdBox1 = BirdBox(
    1,
    const LatLng(51.4751350, -2.6099130),
    seville,
    'This bird box is located in the woodland which runs parallel to Coldharbour Road. '
    "It is just to the left of the end of the path leading down from St Oswald's Road.");
final BirdBox birdBox2 = BirdBox(
    2,
    LatLng(51.4752550, -2.6096700),
    alicante,
    'This bird box is located in the woodland which runs parallel to Coldharbour Road. '
    "If you walk down the path from St Oswald's Road, it is just beyond the path to the left.'");
final BirdBox birdBox3 = BirdBox(
    3,
    LatLng(51.4754010, -2.6095980),
    alicanteOpen,
    "If you walk down the path from St Oswald's Road, it is beyond the path to the left.");
final BirdBox birdBox4 = BirdBox(4, LatLng(51.4753810, -2.6095150), seville,
    "If you walk down the path from St Oswald's Road, it is beyond the path to the left.");
final BirdBox birdBox5 = BirdBox(5, LatLng(51.4755210, -2.6094810), seville,
    "If you walk down the path from St Oswald's Road, it is in the woodland on your left.");
final BirdBox birdBox6 = BirdBox(6, LatLng(51.4748, -2.609345), alicanteOpen,
    "On the front of two trees between St Oswald's Road near the memorial stone.");
final BirdBox birdBox7 = BirdBox(7, LatLng(51.4754220, -2.6090510), alicante,
    'Located opposite number 6 Cossins Road.');
final BirdBox birdBox8 = BirdBox(8, LatLng(51.4752940, -2.6089000), seville,
    'Located opposite number 8 Cossins Road.');
final BirdBox birdBox9 = BirdBox(9, LatLng(51.4749720, -2.6084250), alicante,
    'Located on the tree below the steps down from Cossins Road');
final BirdBox birdBox10 = BirdBox(
    10,
    LatLng(51.474508, -2.608220),
    alicanteOpen,
    "Located on the Veteran Ash Tree at the back of St Oswald's Road");
final BirdBox birdBox11 = BirdBox(11, LatLng(51.4742220, -2.6069800), alicante,
    'On the oak tree opposite the dell above the Veteran Ash Trees');
final BirdBox birdBox12 = BirdBox(
    12,
    LatLng(51.4745460, -2.6069240),
    alicanteOpen,
    'In the dell on a large tree near the Metford Road allotment fence where the fence turns away from the main path');
final BirdBox birdBox13 = BirdBox(13, LatLng(51.4745780, -2.6066050), seville,
    'In the dell on the beech tree by the Metford Road Allotment fence');
final BirdBox birdBox14 = BirdBox(14, LatLng(51.4743460, -2.6065850), seville,
    'In the dell on the oak tree by the path');
final BirdBox birdBox15 = BirdBox(15, LatLng(51.4733320, -2.6067980), seville,
    'On the first tree to the right of the triangle of grass by the tennis court');
final BirdBox birdBox16 = BirdBox(16, LatLng(51.4734230, -2.6061690), seville,
    'On the Plane tree second closest to the playground by the bowling club fence.');

final List<BirdBox> birdBoxesList = [
  birdBox1,
  birdBox2,
  birdBox3,
  birdBox4,
  birdBox5,
  birdBox6,
  birdBox7,
  birdBox8,
  birdBox9,
  birdBox10,
  birdBox11,
  birdBox12,
  birdBox13,
  birdBox14,
  birdBox15,
  birdBox16,
];
