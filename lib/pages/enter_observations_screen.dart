import 'package:flutter/material.dart';
import 'package:redland_green_bird_survey/widgets/page_template.dart';

class EnterObservationsScreen extends StatefulWidget {
  @override
  _EnterObservationsScreenState createState() =>
      _EnterObservationsScreenState();
}

class _EnterObservationsScreenState extends State<EnterObservationsScreen> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetList = [
      Stepper(
        currentStep: _currentStep,
        onStepContinue: () {
          setState(() {
            _currentStep++;
          });
        },
        steps: [
          Step(
            title: Text('Which Bird Box?'),
            content: Text('0, 1, 2, 3, 4'),
          ),
          Step(
            title: Text('What time?'),
            content: Text('0, 1, 2, 3, 4'),
          ),
          Step(
            title: Text('What bird did you see?'),
            content: Text('0, 1, 2, 3, 4'),
          ),
          Step(
            title: Text('What bird did you see?'),
            content: Text('0, 1, 2, 3, 4'),
          )
        ],
      ),
    ];

    return PageTemplate(
      title: 'Enter your Observation',
      widgetList: widgetList,
      image: 'assets/greattit.png',
      heroTag: 'greattit',
    );
  }
}
