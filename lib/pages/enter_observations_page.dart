import 'package:flutter/material.dart';
import 'package:redland_green_bird_survey/models/sighting.dart';
import 'package:redland_green_bird_survey/pages/observation_widgets/select_bird_box_no.dart';
import 'package:redland_green_bird_survey/pages/observation_widgets/step.dart';
import 'package:redland_green_bird_survey/pages/observation_widgets/time_of_observation.dart';

class EnterObservationsPage extends StatefulWidget {
  final int birdBox;
  final Sighting sighting;

  const EnterObservationsPage({Key key, this.birdBox, this.sighting})
      : super(key: key);
  @override
  _EnterObservationsPageState createState() => _EnterObservationsPageState();
}

class _EnterObservationsPageState extends State<EnterObservationsPage> {
  int _birdBox = -1;
  DateTime _dateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.25,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/greattit.png',
              ),
              fit: BoxFit.fill,
            ),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: FittedBox(
                  child: Text(
                    'Enter Observations',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: CustomStepper(
            customStepList: [
              CustomStep(
                  stepNumber: 1,
                  title: 'Select the bird box number',
                  content: SelectBirdBoxNo(
                    birdBox: _birdBox,
                    context: context,
                    onSelect: (int birdBox) {
                      setState(() {
                        _birdBox = birdBox;
                      });
                    },
                  ),
                  proceed: _birdBox != -1,
                  onNext: () {
                    if (_birdBox == -1) {
                      return;
                    }
                  },
                  isLast: false,
                  isFirst: true,
                  errorMsg: 'Please select a box.'),
              CustomStep(
                stepNumber: 2,
                title: 'Time of Observation',
                content: TimeOfObservation(
                  dateTime: _dateTime,
                  onSelected: (DateTime dateTime) {
                    _dateTime = dateTime;
                  },
                  maxDate: DateTime.now(),
                ),
                onNext: () {},
                isLast: false,
                isFirst: false,
                proceed: true,
              ),
              CustomStep(
                stepNumber: 1,
                title: 'Please select the bird box',
                content: Text('hi'),
                onNext: () {},
                isLast: false,
                isFirst: false,
              ),
              CustomStep(
                stepNumber: 1,
                title: 'Please select the bird box',
                content: Text('hi'),
                onNext: () {},
                isLast: false,
                isFirst: false,
              ),
              CustomStep(
                stepNumber: 1,
                title: 'Please select the bird box',
                content: Text('hi'),
                onNext: () {},
                isLast: false,
                isFirst: false,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
