import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:redland_green_bird_survey/providers/birdboxes_provider.dart';
import 'package:redland_green_bird_survey/providers/birds_provider.dart';
import 'package:redland_green_bird_survey/providers/sightings_type_provider.dart';
import 'package:redland_green_bird_survey/widgets/page_template.dart';

class EnterObservationsScreen extends StatefulWidget {
  @override
  _EnterObservationsScreenState createState() =>
      _EnterObservationsScreenState();
}

class _EnterObservationsScreenState extends State<EnterObservationsScreen> {
  int _currentStep = 0;
  int _birdbox = -1;
  int _bird = -1;
  int _sighting_type = -1;
  DateTime _dateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetList = [
      SizedBox(
        height: 800,
        child: Stepper(
          onStepContinue: () {
            if (_currentStep < 3) {
              setState(() {
                _currentStep++;
              });
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
                  OutlinedButton(
                    onPressed: onStepCancel,
                    child: const Text('BACK'),
                  ),
                SizedBox(width: 20),
                OutlinedButton(
                  onPressed: onStepContinue,
                  child: const Text('NEXT'),
                ),
              ],
            );
          },
          currentStep: _currentStep,
          steps: [
            Step(
              title: Text('Select the Bird Box Number'),
              content: Container(
                height: 300,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: 200,
                        child: GridView.builder(
                            itemCount: BirdBoxes.birdBoxesList.length,
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                              childAspectRatio: 1,
                              maxCrossAxisExtent: 60,
                            ),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _birdbox = index;
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: Colors.green[50],
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(60),
                                    ),
                                    boxShadow: [
                                      new BoxShadow(
                                        color: Colors.grey,
                                        offset: new Offset(3.0, 3.0),
                                        blurRadius: 3.0,
                                      )
                                    ],
                                    border: Border.all(
                                      width: _birdbox == index ? 2.0 : 0.0,
                                      color: Colors.blueAccent,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      (index + 1).toString(),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                      _birdbox == -1
                          ? Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.green[50],
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                boxShadow: [
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
                              child: Text(
                                  'Tap here to see the map of where all the bird boxes are located'))
                          : Text(BirdBoxes
                              .birdBoxesList[_birdbox].locationDescription),
                    ],
                  ),
                ),
              ),
            ),
            Step(
              title: Text('Time of Observation'),
              content: Container(
                height: 100,
                child: CupertinoTheme(
                  data: CupertinoThemeData(
                    textTheme: CupertinoTextThemeData(
                      dateTimePickerTextStyle: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.dateAndTime,
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
              title: Text('Select which bird you saw'),
              content: SizedBox(
                height: 200,
                width: double.infinity,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    childAspectRatio: 0.8,
                    maxCrossAxisExtent: 120,
                  ),
                  itemCount: Birds.birdsList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _bird = index;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.green[50],
                          border: Border.all(
                            width: _bird == index ? 3.0 : 0.0,
                            color: Colors.blueAccent,
                          ),
                          boxShadow: [
                            new BoxShadow(
                              color: Colors.grey,
                              offset: new Offset(3.0, 3.0),
                              blurRadius: 3.0,
                            )
                          ],
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 8),
                            ClipOval(
                              child: SizedBox(
                                height: 70,
                                width: 70,
                                child: Birds.birdsList[index].image.length == 0
                                    ? Container(
                                        color: Birds.birdsList[index].name ==
                                                'None'
                                            ? Colors.grey[400]
                                            : Colors.white,
                                        child: Center(
                                          child: Text(
                                            Birds.birdsList[index].name ==
                                                    'None'
                                                ? ''
                                                : '?',
                                            style: TextStyle(fontSize: 30),
                                          ),
                                        ),
                                      )
                                    : Image.asset(
                                        Birds.birdsList[index].image[0],
                                        fit: BoxFit.fitHeight),
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              Birds.birdsList[index].name,
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Step(
                title: Text('Which best describes what you saw?'),
                subtitle: Text(
                    'Should you see more than one, please enter a separate observation.'),
                content: SizedBox(
                  height: 300,
                  child: ListView.builder(
                    itemCount: SightingsTypeProvider.sightingsTypeList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _sighting_type = index;
                          });
                        },
                        child: Container(
                          height: 70,
                          padding: EdgeInsets.all(8),
                          margin: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.green[50],
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                            boxShadow: [
                              new BoxShadow(
                                color: Colors.grey,
                                offset: new Offset(3.0, 3.0),
                                blurRadius: 3.0,
                              )
                            ],
                            border: Border.all(
                              width: _sighting_type == index ? 2.0 : 0.0,
                              color: Colors.blueAccent,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              SightingsTypeProvider
                                  .sightingsTypeList[index].description,
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
      ),
      SizedBox(
        height: 400,
      )
    ];

    return PageTemplate(
      title: 'Enter your Observation',
      widgetList: widgetList,
      image: 'assets/greattit.png',
      heroTag: 'greattit',
    );
  }
}
