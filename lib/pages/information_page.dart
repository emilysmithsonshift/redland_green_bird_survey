import 'dart:io';

import 'package:flutter/material.dart';
import 'package:redland_green_bird_survey/widgets/list_tile.dart';
import 'package:redland_green_bird_survey/widgets/page_template.dart';
import 'package:url_launcher/url_launcher.dart';

class InformationPage extends StatefulWidget {
  @override
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> _widgetList = [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            listTile(
                onTap: () async {
                  await canLaunch(
                          'https://www.instagram.com/giorgio_pede_photography/')
                      ? await launch(
                          'https://www.instagram.com/giorgio_pede_photography/')
                      : throw 'Could not launch https://www.instagram.com/giorgio_pede_photography/';
                },
                imageLeft: false,
                imageAsset: 'assets/jay.png',
                content: [
                  Text(
                    'The beautiful photos on this app are all thanks to local photographer Giorgio Pede.'
                    '\n\nMany of them were taken on Redland Green.'
                    '\n\nTap here to view all his photos on instagram.',
                  ),
                  Icon(Icons.photo_camera_rounded)
                ]),
            listTile(
                onTap: () {
                  final Uri _emailLaunchUri = Uri(
                      scheme: 'mailto',
                      path: 'emily_foulkes@hotmail.com',
                      queryParameters: {
                        'subject': 'Redland Green Bird Survey'
                      });

                  launch(_emailLaunchUri.toString());
                },
                imageLeft: true,
                imageAsset: 'assets/magpie.png',
                content: [
                  Text(
                    'This app was created by Emily Smithson',
                  ),
                  Text(
                      'If you have any comments or suggestions, please e-mail me at emily_foulkes@hotmail.com'),
                  Icon(Icons.mail_outline_rounded)
                ]),
            listTile(
                onTap: () async {
                  await canLaunch(
                          'https://sites.google.com/site/redlandgreencommunity/')
                      ? await launch(
                          'https://sites.google.com/site/redlandgreencommunity/')
                      : throw 'Could not launch https://sites.google.com/site/redlandgreencommunity/';
                },
                imageLeft: false,
                imageAsset: 'assets/crow2.png',
                content: [
                  Text(
                      'Julie Parker from the Redland Green Community Group contributed to the content of this app.'),
                  Text(
                    'For more information please visit our website www.rgcg.org.uk',
                  ),
                  Icon(Icons.navigate_next),
                ]),
            listTile(
                onTap: () async {
                  String url;
                  if (Platform.isAndroid) {
                    url =
                        'https://play.google.com/store/apps/details?id=uk.org.rgcg.redland_green_bird_surveyail';
                  } else {
                    url =
                        'https://apps.apple.com/gb/app/org.uk.rgcg.redlandGreenBirdSurvey/1565525766';
                  }

                  await canLaunch(url)
                      ? await launch(url)
                      : throw 'Could not launch $url';
                },
                imageLeft: true,
                imageAsset: 'assets/dunnock.png',
                content: [
                  Text(
                      'If you enjoyed this app, please consider giving it a 5 star rating'),
                  Text('Tap here to be directed to the app store'),
                  Icon(Icons.star),
                ]),
            listTile(
                onTap: () async {
                  String url;
                  if (Platform.isAndroid) {
                    url =
                        'https://play.google.com/store/apps/details?id=com.flutterdevelopper.redland_green_trail';
                  } else {
                    url =
                        'https://apps.apple.com/gb/app/redland-green-tree-trail/id1511416301';
                  }
                  await canLaunch(url)
                      ? await launch(url)
                      : throw 'Could not launch $url';
                },
                imageLeft: false,
                imageAsset: 'assets/bluetit.png',
                content: [
                  Text(
                    'Why not download the Redland Green Tree Trail?',
                  ),
                  Text(
                      'It takes you on a stroll of Redland Green and teaches you to identify 20 of the local trees.'),
                  Icon(Icons.nature_rounded)
                ]),
            listTile(
                onTap: () async {
                  String url = 'https://rcas.org.uk';

                  await canLaunch(url)
                      ? await launch(url)
                      : throw 'Could not launch $url';
                },
                imageLeft: true,
                imageAsset: 'assets/pigeon.png',
                content: [
                  Text(
                    'We are indebted to Redland and Cotham Amenities Society (rcas.org.uk) who funded the purchase of the nest boxes.',
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: Text('Tap here for more information')),
                  Icon(Icons.navigate_next),
                ]),
            SizedBox(height: 20),
          ],
        ),
      ),
    ];
    return PageTemplate(
      title: 'About',
      image: 'assets/wagtail.png',
      heroTag: 'information',
      widgetList: _widgetList,
    );
  }
}
