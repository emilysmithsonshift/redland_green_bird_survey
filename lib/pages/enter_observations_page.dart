import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:redland_green_bird_survey/models/sighting.dart';
import 'package:redland_green_bird_survey/pages/observation_widgets/select_bird.dart';
import 'package:redland_green_bird_survey/pages/observation_widgets/select_bird_box_no.dart';
import 'package:redland_green_bird_survey/pages/observation_widgets/step.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_page.dart';
import 'observation_widgets/comments.dart';
import 'observation_widgets/time_of_observation.dart';

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
  int _bird = -1;
  DateTime _dateTime = DateTime.now();
  bool showModal;
  String _comment;
  int currentPage = 0;

  void checkShowModal() async {
    final prefs = await SharedPreferences.getInstance();
    showModal = prefs.getBool('showModal') ?? true;
  }

  @override
  void initState() {
    initialise();
    super.initState();
  }

  Future initialise() async {
    await checkShowModal();
    if (widget.birdBox != null) {
      setState(() {
        _birdBox = widget.birdBox;
      });
    }
    // if (widget.sighting != null) {
    //   setState(() {
    //     _birdBox = widget.sighting.birdBox;
    //     _bird = Bird.birdsList
    //         .indexWhere((bird) => widget.sighting.bird == bird.id);
    //     _sightingType = widget.sighting.sightingType;
    //     _furtherDetailstype =
    //         FurtherDetailsOptions.furtherDetailsOptionsList.indexWhere(
    //               (element) => element.id == widget.sighting.furtherDetailsOption,
    //         );
    //     _comment = widget.sighting.comment;
    //     _furtherDetailstype = widget.sighting.furtherDetailsOption;
    //     _dateTime = widget.sighting.dateTime;
    //   });
    // } else {
    //   _dateTime = DateTime.now();
    // }
    // maxDate = DateTime.now();
    // setState(() {
    //   isLoading = false;
    // });

    WidgetsBinding.instance.addPostFrameCallback((_) => showMod());
  }

  void showMod() async {
    if (showModal) {
      showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: Text("How to take a bird box observation:"),
                actions: <Widget>[
                  TextButton(
                    child: const Text('Don\'t show this again'),
                    onPressed: () async {
                      showModal = false;
                      final prefs = await SharedPreferences.getInstance();
                      prefs.setBool('showModal', false);
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: const Text('OK'),
                    onPressed: () => Navigator.of(context).pop(),
                  )
                ],
                content: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Text(
                          "1. Stand quietly, close enough to be able to identify the bird, but not so close as to disturb them. Use binoculars if you have them."
                          "\n\n2. Watch the box until you see a bird entering or leaving the box, or for at least 5 minutes."
                          "\n\n3. Provide observations for as many or as few boxes as you wish, and if possible, repeat the observation over as many days as you can."),
                      Text('\n\nFrequently Asked Questions',
                          style: Theme.of(context).textTheme.headline1),
                      Text(
                          '\nI didn’t see any activity at all. Should I log this?',
                          style: Theme.of(context).textTheme.headline1),
                      Text(
                          "Absolutely! If you have watched a box for at least five minutes, and have not seen any birds entering or leaving the nest, or any activity near to the nest, this is still a valuable record, as it tells us which boxes might not be used at that time. It helps us to decide if we should move the box to a different location. Please submit such findings!"),
                      Text(
                          '\nWhen is the best time of year to spot birds nesting?',
                          style: Theme.of(context).textTheme.headline1),
                      Text(
                          "Birds nest in the spring and summer, so these months are the best times to record activity."
                          " Some birds, such as wrens, might also use nest boxes as winter night time roosts – you need to be around at dawn or dusk to see any evidence of this! You could also use this app to report winter roosts."),
                      Text('\nHow long should I wait at each box?',
                          style: Theme.of(context).textTheme.headline1),
                      Text(
                          "When birds are feeding young, you are more likely to see activity at the nest fairly quickly. "
                          "If you are taking an observation before the young have hatched, "
                          "it may take longer to see if the nest is being used, so wait quietly for at least 5 minutes "
                          'before recording \'no bird seen at box.\''),
                      Text(
                          '\nI entered a comment but it did not show up in my observation. Why?',
                          style: Theme.of(context).textTheme.headline1),
                      Text(
                          "We do monitor the comments but we do not publish them to the public in order to safeguard from anything inappropriate."
                          " Rest assured that your comments will be read by the Redland Green Community Group. "),
                      Text('\nI made a mistake. What should I do?',
                          style: Theme.of(context).textTheme.headline1),
                      Text(
                          "Don't panic! Simply go back to the home page and tap on 'My Details'. "
                          "You can see, edit or delete any of your observations there."),
                    ],
                  ),
                ));
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green[100],
        child: Icon(Icons.help_outline, color: Colors.black),
        onPressed: () {
          showModal = true;
          showMod();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      body: Column(
        children: [
          Hero(
            tag: 'greattit',
            child: Material(
              child: Container(
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
                    stepNumber: 3,
                    title: 'Please select which bird you saw',
                    content: SelectBird(_bird, (int bird) {
                      setState(() {
                        _bird = bird;
                      });
                    }),
                    onNext: () {},
                    errorMsg: 'Please select one.',
                    isLast: false,
                    isFirst: false,
                    proceed: _bird != -1),
                CustomStep(
                  stepNumber: 4,
                  title:
                      'Thank you for your submission. If you have any comments please enter them here.',
                  content: SizedBox(
                    height: 300,
                    child: Comments(onChanged: (String comment) {
                      _comment = comment;
                    }),
                  ),
                  onNext: () {
                    final Sighting _sighting = Sighting(
                      dateTime: _dateTime,
                      birdBox: _birdBox,
                      userEmail: FirebaseAuth.instance.currentUser.email,
                      user: FirebaseAuth.instance.currentUser.displayName,
                      bird: _bird,
                      comment: _comment,
                    );
                    if (widget.sighting != null) {
                      Sighting.updateSighting(_sighting, widget.sighting.id);
                    } else {
                      Sighting.addSighting(_sighting);
                    }

                    showDialog<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title:
                                Text("Thank you for entering an observation."),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('Enter another observation'),
                                onPressed: () {
                                  setState(() {
                                    _birdBox = -1;
                                    _bird = -1;
                                    DateTime _dateTime = DateTime.now();
                                    _comment = '';
                                  });

                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => EnterObservationsPage(),
                                    ),
                                  );
                                },
                              ),
                              TextButton(
                                child: const Text('OK'),
                                onPressed: () => Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        HomePage(),
                                  ),
                                  (Route<dynamic> route) => false,
                                ),
                              ),
                            ],
                            content: Text(
                                'Your observations will help us better understand how the bird boxes are used.'),
                          );
                        });
                  },
                  proceed: true,
                  isLast: true,
                  isFirst: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
