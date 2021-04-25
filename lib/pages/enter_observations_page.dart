import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:redland_green_bird_survey/model/main_model.dart';
import 'package:redland_green_bird_survey/pages/observation_widgets/observation_description.dart';
import 'package:redland_green_bird_survey/pages/observation_widgets/select_bird.dart';
import 'package:redland_green_bird_survey/pages/observation_widgets/select_bird_box_no.dart';
import 'package:redland_green_bird_survey/pages/observation_widgets/time_of_observation.dart';
import 'package:redland_green_bird_survey/providers/birds_provider.dart';
import 'package:redland_green_bird_survey/providers/sightings_provider.dart';
import 'package:redland_green_bird_survey/providers/sightings_type_provider.dart';
import 'package:redland_green_bird_survey/widgets/page_template.dart';
import 'package:redland_green_bird_survey/widgets/step.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

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

  DateTime _dateTime = DateTime.now();

  @override
  void initState() {
    if (widget.birdBox != null) {
      _birdBox = widget.birdBox;
    }
    if (widget.sighting != null) {
      _birdBox = widget.sighting.birdBox;
      _bird = birdsList
          .indexWhere((bird) => widget.sighting.bird.name == bird.name);
      _sightingType = widget.sighting.sightingType.id;
      _comment = widget.sighting.comment;
      _dateTime = widget.sighting.dateTime;
    }
    super.initState();
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
      content: TimeOfObservation(
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
          if (_bird == birdsList.length - 1) {
            _sightingType = 0;
          }
          setState(() {
            _birdErrorMsg = false;
            _scrollToNextWidget();
          });
        }
      },
    );
    Widget _step4 = step(
      context: context,
      stepNumber: 4,
      title: 'Which best describes what you saw?',
      showErrorMsg: sightingTypeErrorMsg,
      errorMsg: 'Please select one.',
      subtitle:
          'Should you see more than one, please enter a separate observation.',
      content: ObservationDescription((int index) {
        setState(() {
          _sightingType = index;
        });
      }, _sightingType),
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
          setState(
            () {
              sightingTypeErrorMsg = false;
              _scrollToNextWidget();
            },
          );
        }
      },
    );
    Widget _step5 = step(
      showErrorMsg: false,
      context: context,
      stepNumber: 5,
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
      },
      nextButtonText: 'Submit',
      onNext: () {
        final Sighting _sighting = Sighting(
            dateTime: _dateTime,
            birdBox: _birdBox,
            userEmail: FirebaseAuth.instance.currentUser.email,
            user: FirebaseAuth.instance.currentUser.displayName,
            sightingType: sightingsTypeList[_sightingType],
            bird: birdsList[_bird],
            comment: _comment);
        if (widget.sighting != null) {
          updateSighting(_sighting, widget.sighting.id);
        } else {
          addSighting(_sighting);
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
    ];
    final List<Widget> widgetList = [
      SizedBox(
        height: MediaQuery.of(context).size.height - 240,
        child: ScrollablePositionedList.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemScrollController: itemScrollController,
            itemCount: steps.length,
            itemBuilder: (context, index) {
              return steps[index];
            }),
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
