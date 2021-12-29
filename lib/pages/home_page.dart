import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:redland_green_bird_survey/models/news.dart';
import 'package:redland_green_bird_survey/models/sighting.dart';
import 'package:redland_green_bird_survey/pages/bird_identifier_page.dart';
import 'package:redland_green_bird_survey/pages/information_page.dart';
import 'package:redland_green_bird_survey/pages/interesting_facts.dart';
import 'package:redland_green_bird_survey/pages/my_details_page.dart';
import 'package:redland_green_bird_survey/pages/news_page.dart';
import 'package:redland_green_bird_survey/pages/welcome_page.dart';
import 'package:redland_green_bird_survey/widgets/observation_summary.dart';
import 'package:redland_green_bird_survey/widgets/page_template.dart';
import 'package:redland_green_bird_survey/widgets/rg_grid_tile.dart';
import 'package:redland_green_bird_survey/widgets/rg_list_tile.dart';

import 'bird_box_list_page.dart';
import 'enter_observations_page.dart';
import 'latest_observations_page.dart';
import 'map_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<bool> loading;
  @override
  void initState() {
    News.getNews()
      ..then((_) {
        setState(() {});
      });
    Sighting.getSightings()
      ..then((_) {
        setState(() {});
      });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _widgetList = [
      RGListTile(
        navigateTo: WelcomePage(),
        imageAsset: 'assets/bluetit.png',
        heroTag: 'welcome',
        imageLeft: false,
        widget: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Wrap(
            children: [
              Center(
                child: Text(
                  'Welcome!\n',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              Text(
                  'In 2020, Redland Green Community Group installed 16 bird boxes in trees around the green.'
                  '\n\nThis app has been created to track the boxes and their inhabitants.'
                  '\n\nTap for more information.')
            ],
          ),
        ),
      ),
      ValueListenableBuilder(
          valueListenable: Sighting.observationsNotifier,
          builder: (context, value, child) {
            return RGListTile(
              imageAsset: 'assets/goldfinch4.png',
              alignment: Alignment.centerLeft,
              navigateTo: LatestObservationsPage(),
              heroTag: 'goldfinch',
              imageLeft: true,
              widget: Sighting.observations.isNotEmpty
                  ? Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Center(
                            child: Text('Recent Bird Sightings at Boxes',
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.headline1),
                          ),
                        ),
                        Expanded(
                          child: Wrap(
                            spacing: 8.0, // gap between adjacent chips
                            runSpacing: 4.0,
                            children: Sighting.sightings.map((sighting) {
                              return observationSummary(sighting, context);
                            }).toList(),
                          ),
                        )
                      ],
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
            );
          }),
      RGListTile(
        imageAsset: 'assets/longtailedtit2.png',
        alignment: Alignment.center,
        navigateTo: NewsPage(),
        heroTag: 'latestNews',
        imageLeft: false,
        widget: News.newsList.isEmpty
            ? CircularProgressIndicator()
            : Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Center(
                      child: Text('Latest News',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline1),
                    ),
                  ),
                  Expanded(
                    child: Wrap(
                      spacing: 8.0, // gap between adjacent chips
                      runSpacing: 4.0,
                      children: News.newsList.map((news) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            children: [
                              SizedBox(
                                width: double.infinity,
                                child: Text(
                                  Jiffy([
                                    news.dateTime.year,
                                    news.dateTime.month,
                                    news.dateTime.day
                                  ]).format('do MMMM yyyy'),
                                  style: Theme.of(context).textTheme.headline2,
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: Text(
                                  news.headline,
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  )
                ],
              ),
      ),
    ];

    final List<Widget> _gridList = [
      RGGridTile(
          heroTag: 'songthrush',
          navigateTo: BirdIdentifierScreen(),
          text: 'Redland Green Birds',
          imageAsset: 'assets/songthrush.png'),
      RGGridTile(
          heroTag: 'greattit',
          navigateTo: EnterObservationsPage(),
          setState: () {
            setState(() {});
          },
          text: 'Enter observations ',
          imageAsset: 'assets/greattit.png'),
      RGGridTile(
          heroTag: 'map_page',
          navigateTo: MapPage(),
          text: 'Map',
          imageAsset: 'assets/dunnock.png'),
      RGGridTile(
          heroTag: 'bird_box_list',
          navigateTo: BirdBoxListPage(),
          text: 'Bird Box List',
          imageAsset: 'assets/jay.png'),
      RGGridTile(
          heroTag: 'my_details',
          navigateTo: MyDetailsPage(),
          text: 'My details',
          imageAsset: 'assets/coaltit1.png'),
      RGGridTile(
        heroTag: 'fact_page',
        navigateTo: FactPage(),
        text: 'Did you know?',
        imageAsset: 'assets/nuthatch_close.png',
      ),
      RGGridTile(
          heroTag: 'information',
          navigateTo: InformationPage(),
          text: 'About',
          imageAsset: 'assets/wagtail.png'),
    ];

    return RefreshIndicator(
      onRefresh: () async {
        await Sighting.getSightings();
        setState(() {});
      },
      child: Scaffold(
        body: PageTemplate(
          title: 'Redland Green Bird Box Survey',
          image: 'assets/robin1.png',
          listTileList: _widgetList,
          gridList: _gridList,
          heroTag: 'robin1',
        ),
      ),
    );
  }
}
