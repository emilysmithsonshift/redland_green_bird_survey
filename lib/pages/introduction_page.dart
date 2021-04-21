import 'package:flutter/material.dart';
import 'package:redland_green_bird_survey/pages/registration_page.dart';
import 'package:redland_green_bird_survey/widgets/page_template.dart';

import 'login_page.dart';

class IntroductionPage extends StatelessWidget {
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
                '\nIn 2018 Redland Green Community Group installed 16 bird boxes around the Green'
                '\n\nThis app has been created to enable the community to monitor the boxes and learn more about the birdlife on Redland Green. '
                '\n\nIn order to use this app you will need to register or log in if you have previously registered \n\n'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    },
                    child: const Text('Login')),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegistrationPage(),
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
