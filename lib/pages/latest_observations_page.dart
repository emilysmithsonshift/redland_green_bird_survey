import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:redland_green_bird_survey/models/sighting.dart';
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
        _sightingList = Sighting.observations
            .where((sighting) => sighting.bird != 0)
            .toList();
        break;
      case 1:
        _sightingList = Sighting.observations;
        break;
      case 2:
        _sightingList = Sighting.observations
            .where((sighting) =>
                sighting.userEmail == FirebaseAuth.instance.currentUser!.email)
            .toList();
        break;
    }
    final widgetList = [
      Column(
        children: [
          SizedBox(
            height: 60,
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
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Latest Bird Sightings',
                        style: Theme.of(context).textTheme.headline2!.copyWith(
                            fontWeight: _sortList == 0
                                ? FontWeight.bold
                                : FontWeight.normal,
                            color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
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
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'All Observations',
                        style: Theme.of(context).textTheme.headline2!.copyWith(
                            fontWeight: _sortList == 1
                                ? FontWeight.bold
                                : FontWeight.normal,
                            color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
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
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'My Observations',
                        style: Theme.of(context).textTheme.headline2!.copyWith(
                            fontWeight: _sortList == 2
                                ? FontWeight.bold
                                : FontWeight.normal,
                            color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          _sightingList.isEmpty
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('You have no observations yet.'),
                )
              : Column(
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
        await Sighting.getSightings();
        setState(() {});
      },
      child: PageTemplate(
        title: 'Latest Observations',
        image: 'assets/goldfinch4.png',
        heroTag: 'goldfinch',
        widgetList: widgetList,
      ),
    );
  }
}
