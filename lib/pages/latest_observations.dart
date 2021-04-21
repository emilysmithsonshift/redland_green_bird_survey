import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:redland_green_bird_survey/model/main_model.dart';
import 'package:redland_green_bird_survey/providers/sightings_provider.dart';
import 'package:redland_green_bird_survey/widgets/page_template.dart';

class LatestObservationsScreen extends StatefulWidget {
  @override
  _LatestObservationsScreenState createState() =>
      _LatestObservationsScreenState();
}

class _LatestObservationsScreenState extends State<LatestObservationsScreen> {
  int _sortList = 0;
  Widget observationDetails(Sighting sighting) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1, color: Colors.grey),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(5.0, 5.0),
            blurRadius: 5.0,
          )
        ],
      ),
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ClipOval(
            child: SizedBox(
              height: 70,
              width: 70,
              child: sighting.bird.image.isEmpty
                  ? Container(
                      color: sighting.bird.name == 'None'
                          ? Colors.grey[400]
                          : Colors.white,
                      child: Center(
                        child: Text(
                          sighting.bird.name == 'None' ? '' : '?',
                          style: const TextStyle(fontSize: 30),
                        ),
                      ),
                    )
                  : Image.asset(sighting.bird.image[0], fit: BoxFit.fitHeight),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    sighting.bird.name ?? 'None',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${DateFormat('d MMMM yyyy').format(sighting.dateTime)} ${DateFormat.jm().format(sighting.dateTime)}',
                  ),
                  const SizedBox(height: 4),
                  Text(
                    sighting.sightingType.description,
                  ),
                  const SizedBox(height: 4),
                  Text('Observed by: ${sighting.user}',
                      style: const TextStyle(fontWeight: FontWeight.bold))
                ],
              ),
            ),
          ),
          ClipOval(
            child: Container(
                color: Colors.green[100],
                height: 70,
                width: 70,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Center(
                    child: Text(
                      'Box no:\n${sighting.birdBox}',
                      textAlign: TextAlign.center,
                    ),
                  ),
                )),
          )
        ],
      ),
    );
  }

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
                return observationDetails(sighting);
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
