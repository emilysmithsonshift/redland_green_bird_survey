import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:redland_green_bird_survey/models/birds.dart';
import 'package:redland_green_bird_survey/models/further_details_options.dart';
import 'package:redland_green_bird_survey/models/sighting.dart';
import 'package:redland_green_bird_survey/models/sighting_type.dart';
import 'package:redland_green_bird_survey/pages/observation_widgets/observation_description.dart';
import 'package:redland_green_bird_survey/pages/observation_widgets/select_bird.dart';
import 'package:redland_green_bird_survey/pages/observation_widgets/select_bird_box_no.dart';
import 'package:redland_green_bird_survey/pages/observation_widgets/time_of_observation.dart';
import 'package:redland_green_bird_survey/widgets/page_template.dart';
import 'package:redland_green_bird_survey/widgets/step.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_page.dart';
import 'observation_widgets/comments.dart';

class EnterObservationsPage extends StatefulWidget {
  final int birdBox;
  final Sighting sighting;

  const EnterObservationsPage({this.birdBox, Key key, this.sighting})
      : super(key: key);

  @override
  _EnterObservationsPageState createState() => _EnterObservationsPageState();
}

class _EnterObservationsPageState extends State<EnterObservationsPage> {
  int _currentStep = 0;
  int _birdBox = -1;
  bool _birdBoxErrorMsg = false;
  int _bird = -1;
  bool _birdErrorMsg = false;
  int _sightingType = -1;
  bool sightingTypeErrorMsg = false;
  String _comment = '';
  int _furtherDetailstype = -1;
  DateTime _dateTime;
  bool showModal = true;
  DateTime maxDate;
  bool isLoading = true;

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
    if (widget.sighting != null) {
      setState(() {
        _birdBox = widget.sighting.birdBox;
        _bird = Bird.birdsList
            .indexWhere((bird) => widget.sighting.bird == bird.id);
        _sightingType = widget.sighting.sightingType;
        _furtherDetailstype =
            FurtherDetailsOptions.furtherDetailsOptionsList.indexWhere(
          (element) => element.id == widget.sighting.furtherDetailsOption,
        );
        _comment = widget.sighting.comment;
        _furtherDetailstype = widget.sighting.furtherDetailsOption;
        _dateTime = widget.sighting.dateTime;
      });
    } else {
      _dateTime = DateTime.now();
    }
    maxDate = DateTime.now();
    setState(() {
      isLoading = false;
    });

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
                          '\nI did not see any activity at all, should I log this?',
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
                      Text('\nI made a mistake, what should I do?',
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
    ItemScrollController itemScrollController = ItemScrollController();
    void _scrollToNextWidget() {
      _currentStep++;
      itemScrollController.scrollTo(
          index: _currentStep,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeIn);
    }

    void _scrollToPreviousWidget() {
      _currentStep--;
      itemScrollController.scrollTo(
          index: _currentStep,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeIn);
    }

    Widget _step1 = step(
      context: context,
      stepNumber: 1,
      title: 'Select the Bird Box Number',
      content: SelectBirdBoxNo(_birdBox, (int value) {
        setState(() {
          _birdErrorMsg = false;
          _birdBox = value;
        });
      }, context),
      showPrevious: false,
      errorMsg: 'Please select one.',
      showErrorMsg: _birdBoxErrorMsg,
      onNext: () {
        if (_birdBox == -1) {
          setState(() {
            _birdBoxErrorMsg = true;
          });
        } else {
          _birdBoxErrorMsg = false;
          _scrollToNextWidget();
        }
      },
    );
    Widget _step2 = step(
      context: context,
      stepNumber: 2,
      showErrorMsg: false,
      title: 'Time of Observation',
      content: isLoading
          ? CircularProgressIndicator()
          : TimeOfObservation(
              maxDate: maxDate,
              dateTime: _dateTime,
              onSelected: (DateTime dateTime) {
                setState(() {
                  _dateTime = dateTime;
                });
              }),
      showPrevious: true,
      onBack: () {
        _scrollToPreviousWidget();
      },
      onNext: () {
        _scrollToNextWidget();
      },
    );

    Widget _step3 = step(
      context: context,
      stepNumber: 3,
      title: 'Which best describes what you saw?',
      showErrorMsg: sightingTypeErrorMsg,
      errorMsg: 'Please select one.',
      subtitle:
          'If you have more than one observation, please make a separate observation record for each one.',
      content: ObservationDescription(
        onSelected: (int index) {
          setState(() {
            _sightingType = index;
          });
        },
        sightingType: _sightingType,
        sightingTypeList: SightingType.sightingsTypeList,
      ),
      showPrevious: true,
      onBack: () {
        _scrollToPreviousWidget();
      },
      onNext: () {
        if (_sightingType == -1) {
          setState(() {
            sightingTypeErrorMsg = true;
          });
        } else {
          sightingTypeErrorMsg = false;
          if (_sightingType == 0) {
            _bird = 0;
            setState(() {
              _scrollToNextWidget();
              _scrollToNextWidget();
              _scrollToNextWidget();
            });
          }
          setState(
            () {
              _scrollToNextWidget();
            },
          );
        }
      },
    );
    Widget _step4 = step(
      context: context,
      stepNumber: 4,
      title: 'Can you provide any more detail?',
      showErrorMsg: sightingTypeErrorMsg,
      errorMsg: '',
      subtitle:
          'If you can provide more detail on what you saw, select one of the following'
          'options, otherwise move on to the last question.',
      content: ObservationDescription(
        onSelected: (int index) {
          setState(() {
            _furtherDetailstype = index;
          });
        },
        sightingType: _furtherDetailstype,
        sightingTypeList: FurtherDetailsOptions.furtherDetailsOptionsList,
      ),
      showPrevious: true,
      onBack: () {
        _scrollToPreviousWidget();
      },
      onNext: () {
        sightingTypeErrorMsg = false;
        setState(() {
          _scrollToNextWidget();
        });
      },
    );
    Widget _step5 = step(
      context: context,
      stepNumber: 5,
      showErrorMsg: _birdErrorMsg,
      errorMsg: 'Please select a bird',
      title: 'Select which bird you saw',
      content: SelectBird(_bird, (int bird) {
        setState(() {
          _bird = bird;
        });
      }),
      showPrevious: true,
      onBack: () {
        _scrollToPreviousWidget();
      },
      onNext: () {
        if (_bird == -1) {
          setState(() {
            _birdErrorMsg = true;
          });
        } else {
          setState(() {
            _birdErrorMsg = false;
            _scrollToNextWidget();
          });
        }
      },
    );
    Widget _step6 = step(
      showErrorMsg: false,
      context: context,
      stepNumber: 6,
      title: 'Any comments (Optional)',
      content: Comments(
        onChanged: (value) {
          setState(() {
            _comment = value;
          });
        },
        comment: _comment,
      ),
      showPrevious: true,
      onBack: () {
        _scrollToPreviousWidget();
        if (_sightingType == 0) {
          _scrollToPreviousWidget();
          _scrollToPreviousWidget();
          _scrollToPreviousWidget();
        }
      },
      nextButtonText: 'Submit',
      onNext: () {
        final Sighting _sighting = Sighting(
          dateTime: _dateTime,
          birdBox: _birdBox,
          userEmail: FirebaseAuth.instance.currentUser.email,
          user: FirebaseAuth.instance.currentUser.displayName,
          sightingType: SightingType.sightingsTypeList[_sightingType].id,
          bird: _bird,
          comment: _comment,
          furtherDetailsOption: _furtherDetailstype == -1
              ? 0
              : FurtherDetailsOptions
                  .furtherDetailsOptionsList[_furtherDetailstype].id,
        );
        if (widget.sighting != null) {
          Sighting.updateSighting(_sighting, widget.sighting.id);
        } else {
          Sighting.addSighting(_sighting);
        }
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => HomePage(),
          ),
          (Route<dynamic> route) => false,
        );
      },
    );

    List<Widget> steps = [
      _step1,
      _step2,
      _step3,
      _step4,
      _step5,
      _step6,
    ];
    final List<Widget> widgetList = [
      SizedBox(
        height: MediaQuery.of(context).size.height - 240,
        child: Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.startDocked,
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: IconButton(
              color: Colors.blue,
              onPressed: () {
                showModal = true;
                showMod();
              },
              icon: Icon(Icons.help_outline),
            ),
          ),
          body: ScrollablePositionedList.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemScrollController: itemScrollController,
              itemCount: steps.length,
              itemBuilder: (context, index) {
                return steps[index];
              }),
        ),
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
