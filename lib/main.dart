import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:redland_green_bird_survey/pages/introduction_page.dart';

import 'pages/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.black),
          headline2: TextStyle(
              fontSize: 14.0, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      title: 'Redland Green Bird Survey',
      home: FutureBuilder(
          future: _fbApp,
          builder: (context, snapshot) {
            // FirebaseAuth.instance.signOut();
            if (snapshot.hasError) {
              return const Text('Something went wrong!');
            } else if (snapshot.hasData) {
              if (FirebaseAuth.instance.currentUser == null) {
                return IntroductionPage();
              } else {
                return HomePage();
              }
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
