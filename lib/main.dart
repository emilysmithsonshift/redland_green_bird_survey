import 'package:flutter/material.dart';
import 'package:redland_green_bird_survey/pages/bird_identifier.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Redland Green Bird Survey',
      home: BirdIdentifierScreen(),
    );
  }
}
