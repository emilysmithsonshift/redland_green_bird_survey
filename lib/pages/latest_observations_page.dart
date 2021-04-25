import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:redland_green_bird_survey/model/main_model.dart';
import 'package:redland_green_bird_survey/providers/sightings_provider.dart';
import 'package:redland_green_bird_survey/widgets/observation_widget.dart';
import 'package:redland_green_bird_survey/widgets/page_template.dart';

class LatestObservationsPage extends StatefulWidget {
  @override
  _LatestObservationsPageState createState() => _LatestObservationsPageState();
}

class _LatestObservationsPageState extends State<LatestObservationsPage> {
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
                sighting.userEmail == FirebaseAuth.instance.currentUser.email)
            .toList();
        break;
    }
    final widgetList = [
      Column(
        children: [
          SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _sortList = 0;
                      });
                    },
                    child: Text(
                      'Latest Sightings',
                      style: Theme.of(context).textTheme.headline1.copyWith(
                          fontWeight: _sortList == 0
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Flexible(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _sortList = 1;
                      });
                    },
                    child: Text(
                      'All Obs',
                      style: Theme.of(context).textTheme.headline1.copyWith(
                          fontWeight: _sortList == 1
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Flexible(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _sortList = 2;
                      });
                    },
                    child: Text(
                      'My Obs',
                      style: Theme.of(context).textTheme.headline1.copyWith(
                          fontWeight: _sortList == 2
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: _sightingList.map((sighting) {
              return observationDetails(
                sighting: sighting,
                context: context,
                showBoxNo: true,
                showUser: true,
              );
            }).toList(),
          )
        ],
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
