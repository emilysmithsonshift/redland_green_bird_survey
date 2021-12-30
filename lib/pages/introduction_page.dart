import 'package:flutter/material.dart';
import 'package:redland_green_bird_survey/pages/registration_page.dart';
import 'package:redland_green_bird_survey/widgets/page_template.dart';

import '../settings.dart';
import 'login_page.dart';
import 'map_page.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> _widgetList = [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text(
              'Welcome to the Redland Green Bird Survey App',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const Text(
                '\nIn 2020 Redland Green Community Group installed 16 bird boxes around the Green'
                '\n\nThis app has been created to enable the community to monitor the boxes and learn more about the birdlife on Redland Green. '),
            Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.all(8),
                decoration: defaultBoxDecoration(color: Colors.green[50]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        'Helping out is as easy as 1 2 3\n',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => const MapPage()));
                      },
                      child: const Text(
                        '1. Find a bird Box',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => const MapPage()));
                      },
                      child: const Text(
                        'Use the handy map to help you.\n',
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '2. Observe',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                        'Watch the bird box to see if there is any activity.\n'),
                    const SizedBox(height: 8),
                    const Text(
                      '3. Enter your observation into the app',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text('It is quick and easy.'),
                    const SizedBox(height: 8),
                  ],
                )),
            const Text(
                '\n\nIn order to use this app you will need to register or log in if you have previously registered \n\n'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    child: const Text('Login')),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegistrationPage(),
                        ),
                      );
                    },
                    child: const Text('Register'))
              ],
            )
          ],
        ),
      ),
    ];
    return PageTemplate(
      heroTag: 'introduction',
      title: 'Introduction',
      image: 'assets/bluetit.png',
      widgetList: _widgetList,
    );
  }
}
