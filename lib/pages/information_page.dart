import 'package:flutter/material.dart';
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
            _listTile(
                onTap: () async {
                  await canLaunch(
                          'https://www.instagram.com/giorgio_pede_photography/')
                      ? await launch(
                          'https://www.instagram.com/giorgio_pede_photography/')
                      : throw 'Could not launch https://www.instagram.com/giorgio_pede_photography/';
                },
                imageLeft: true,
                imageAsset: 'assets/jay.png',
                content: [
                  Text(
                    'The beautiful photos on this app are all thanks to local photographer Giorgio Pede.'
                    '\n\nMany of them were taken on Redland Green.'
                    '\n\nTap here to view all his photos on instagram.',
                  ),
                  Icon(Icons.photo_camera_rounded)
                ]),
            _listTile(
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
                      'This app and the bird boxes would not have been possible without the hard work of '
                      'Redland Green Community Group, in particular Julie Parker.'),
                  Text(
                    'For more information about Redland Green Community Group please visit our website www.rgcg.org.uk',
                  ),
                ]),
            _listTile(
                onTap: () {},
                imageLeft: true,
                imageAsset: 'assets/dunnock.png',
                content: [
                  Text(
                      'If you enjoyed this app, please consider giving it a 5 star rating'),
                  Text('Tap here to be directed to the app store'),
                  Icon(Icons.star),
                ]),
            _listTile(
                onTap: () {},
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
            _listTile(
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
            SizedBox(height: 20),
          ],
        ),
      ),
    ];
    return PageTemplate(
      title: 'Information',
      image: 'assets/wagtail.png',
      heroTag: 'information',
      widgetList: _widgetList,
    );
  }

  Widget _listTile(
      {Function onTap,
      bool imageLeft,
      String imageAsset,
      List<Widget> content}) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        height: 200,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(5.0, 5.0),
              blurRadius: 5.0,
            )
          ],
        ),
        child: Row(
          children: [
            if (imageLeft)
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: AssetImage(
                        imageAsset,
                      ),
                    ),
                  ),
                ),
              ),
            Flexible(
              flex: 2,
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green[50],
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(imageLeft ? 20.0 : 0),
                      bottomRight: Radius.circular(imageLeft ? 20.0 : 0),
                      topLeft: Radius.circular(imageLeft ? 0.0 : 20),
                      bottomLeft: Radius.circular(imageLeft ? 0.0 : 20),
                    ),
                  ),
                  child: SizedBox(
                      height: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: content,
                        ),
                      ))),
            ),
            if (!imageLeft)
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: AssetImage(
                        imageAsset,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
