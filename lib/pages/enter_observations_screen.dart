import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:redland_green_bird_survey/model/main_model.dart';
import 'package:redland_green_bird_survey/providers/birdboxes_provider.dart';
import 'package:redland_green_bird_survey/providers/birds_provider.dart';
import 'package:redland_green_bird_survey/providers/sightings_provider.dart';
import 'package:redland_green_bird_survey/providers/sightings_type_provider.dart';
import 'package:redland_green_bird_survey/widgets/page_template.dart';

class EnterObservationsScreen extends StatefulWidget {
  @override
  _EnterObservationsScreenState createState() =>
      _EnterObservationsScreenState();
}

class _EnterObservationsScreenState extends State<EnterObservationsScreen> {
  int _currentStep = 0;
  int _birdBox = -1;
  int _bird = -1;
  int _sightingType = -1;
  DateTime _dateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetList = [
      Stepper(
        physics: const ClampingScrollPhysics(),
        onStepContinue: () {
          switch (_currentStep) {
            case 0:
              if (_birdBox != -1) {
                setState(() {
                  _currentStep++;
                });
              }
              break;
            case 1:
              setState(() {
                _currentStep++;
              });
              break;
            case 2:
              if (_bird == birdsList.length) {
                _sightingType = sightingsTypeList.length;
              }
              if (_bird != -1) {
                setState(() {
                  _currentStep++;
                });
              }
              break;
            case 3:
              if (_sightingType != -1) {
                final Sighting _sighting = Sighting(
                    dateTime: _dateTime,
                    birdBox: _birdBox,
                    user: FirebaseAuth.instance.currentUser.displayName,
                    sightingType: sightingsTypeList[_sightingType],
                    bird: birdsList[_bird]);
                addSighting(_sighting);
                Navigator.pop(context);
              }
          }
        },
        onStepCancel: () {
          if (_currentStep > 0) {
            setState(() {
              _currentStep--;
            });
          }
        },
        controlsBuilder: (BuildContext context,
            {onStepContinue, onStepCancel}) {
          return Row(
            children: <Widget>[
              if (_currentStep > 0)
                ElevatedButton(
                  onPressed: onStepCancel,
                  child: const Text('BACK'),
                ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: onStepContinue,
                child: const Text('NEXT'),
              ),
            ],
          );
        },
        currentStep: _currentStep,
        steps: [
          Step(
            title: const Text('Select the Bird Box Number'),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Wrap(
                    children: birdBoxesList.map((birdBox) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _birdBox = birdBox.id - 1;
                      });
                    },
                    child: ClipOval(
                        child: Container(
                            height: 30,
                            width: 30,
                            margin: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.green[50],
                              borderRadius: const BorderRadius.all(
                                Radius.circular(60),
                              ),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(3.0, 3.0),
                                  blurRadius: 3.0,
                                )
                              ],
                              border: Border.all(
                                width: _birdBox == birdBox.id - 1 ? 2.0 : 0.0,
                                color: Colors.blueAccent,
                              ),
                            ),
                            child: Center(child: Text(birdBox.id.toString())))),
                  );
                }).toList()),
                SizedBox(
                  height: 80,
                  child: Center(
                    child: _birdBox == -1
                        ? Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.green[50],
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20),
                              ),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(3.0, 3.0),
                                  blurRadius: 3.0,
                                )
                              ],
                              border: Border.all(
                                width: 0.0,
                                color: Colors.blueAccent,
                              ),
                            ),
                            child: const Text(
                                'Tap here to see the map of where all the bird boxes are located'))
                        : Text(birdBoxesList[_birdBox].locationDescription),
                  ),
                ),
              ],
            ),
          ),
          Step(
            title: const Text('Time of Observation'),
            content: SizedBox(
              height: 100,
              child: CupertinoTheme(
                data: const CupertinoThemeData(
                  textTheme: CupertinoTextThemeData(
                    dateTimePickerTextStyle: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                child: CupertinoDatePicker(
                  minimumYear: 2020,
                  initialDateTime: _dateTime,
                  maximumDate: DateTime.now(),
                  onDateTimeChanged: (DateTime newDateTime) {
                    _dateTime = newDateTime;
                  },
                ),
              ),
            ),
          ),
          Step(
            title: const Text('Select which bird you saw'),
            content: SizedBox(
              height: 200,
              width: double.infinity,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: birdsList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _bird = index;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.green[50],
                        border: Border.all(
                          width: _bird == index ? 3.0 : 0.0,
                          color: Colors.blueAccent,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(3.0, 3.0),
                            blurRadius: 3.0,
                          )
                        ],
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        image: DecorationImage(
                          colorFilter: birdsList[index].image.isEmpty
                              ? const ColorFilter.mode(
                                  Colors.grey, BlendMode.clear)
                              : const ColorFilter.mode(
                                  Colors.white, BlendMode.colorBurn),
                          fit: BoxFit.fill,
                          image: AssetImage(birdsList[index].image.isEmpty
                              ? 'assets/bluetit.png'
                              : birdsList[index].image[0]),
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10.0),
                              bottomRight: Radius.circular(10),
                            ),
                            color: Colors.white60,
                          ),
                          width: double.infinity,
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            birdsList[index].name,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Step(
              title: const Text('Which best describes what you saw?'),
              subtitle: const Text(
                  'Should you see more than one, please enter a separate observation.'),
              content: SizedBox(
                height: 300,
                child: ListView.builder(
                  itemCount: sightingsTypeList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _sightingType = index;
                        });
                      },
                      child: Container(
                        height: 70,
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.green[50],
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(3.0, 3.0),
                              blurRadius: 3.0,
                            )
                          ],
                          border: Border.all(
                            width: _sightingType == index ? 2.0 : 0.0,
                            color: Colors.blueAccent,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            sightingsTypeList[index].description,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ))
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
