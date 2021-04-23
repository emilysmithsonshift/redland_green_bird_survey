import 'package:flutter/material.dart';
import 'package:redland_green_bird_survey/widgets/page_template.dart';

class InformationPage extends StatefulWidget {
  @override
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  final List<Widget> _widgetList = [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: const [
          Text(
            'Welcome to the Redland Green Bird Box Survey',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text(
            '\n\nIn 2018 Redland Green Community Group installed 20 bird boxes all around the green thanks'
            ' to a generous grant from RCAS.'
            '\n\nThis app is designed to use community power to help monitor these bird boxes.'
            '\n\nEnormous thanks to local photographer Giorgio Pede for letting us use his beautiful photos.',
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      title: 'Information',
      image: 'assets/bluetit.png',
      heroTag: 'bluetit',
      widgetList: _widgetList,
    );
  }
}
