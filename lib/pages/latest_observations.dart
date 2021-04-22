import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:redland_green_bird_survey/model/main_model.dart';
import 'package:redland_green_bird_survey/providers/sightings_provider.dart';
import 'package:redland_green_bird_survey/widgets/observation_widget.dart';
import 'package:redland_green_bird_survey/widgets/page_template.dart';

class LatestObservationsScreen extends StatefulWidget {
  @override
  _LatestObservationsScreenState createState() =>
      _LatestObservationsScreenState();
}

class _LatestObservationsScreenState extends State<LatestObservationsScreen> {
  int _sortList = 0;

  @override
  Widget build(BuildContext context) {
    List<Sighting> _sightingList = [];
    switch (_sortList) {
      case 0:
        _sightingList = sightings
            .where((sighting) => sighting.bird.name != 'None')
            .toList();
        break;
      case 1:
        _sightingList = sightings;
        break;
      case 2:
        _sightingList = sightings
            .where((sighting) =>
                sighting.user == FirebaseAuth.instance.currentUser.displayName)
            .toList();
        break;
    }
    final widgetList = [
      Hero(
        tag: 'observations',
        child: Column(
          children: [
            SizedBox(
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _sortList = 0;
                      });
                    },
                    child: Text(
                      'Latest',
                      style: TextStyle(
                        fontWeight: _sortList == 0
                            ? FontWeight.bold
                            : FontWeight.normal,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _sortList = 1;
                      });
                    },
                    child: Text('All',
                        style: TextStyle(
                          fontWeight: _sortList == 1
                              ? FontWeight.bold
                              : FontWeight.normal,
                          fontSize: 18,
                        )),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _sortList = 2;
                      });
                    },
                    child: Text('My Obs',
                        style: TextStyle(
                          fontWeight: _sortList == 2
                              ? FontWeight.bold
                              : FontWeight.normal,
                          fontSize: 18,
                        )),
                  ),
                ],
              ),
            ),
            Column(
              children: _sightingList.map((sighting) {
                return observationDetails(sighting, context, true);
              }).toList(),
            )
          ],
        ),
      )
    ];
    return RefreshIndicator(
      onRefresh: () async {
        await getSightings();
        setState(() {});
      },
      child: PageTemplate(
        title: 'Latest Observations',
        image: 'assets/wagtail.png',
        heroTag: 'wagtail',
        widgetList: widgetList,
      ),
    );
  }
}
