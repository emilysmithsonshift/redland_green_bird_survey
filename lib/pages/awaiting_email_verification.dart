import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:redland_green_bird_survey/pages/introduction_page.dart';
import 'package:redland_green_bird_survey/widgets/page_template.dart';

import '../main.dart';
import '../settings.dart';

class AwaitingEmailVerification extends StatefulWidget {
  const AwaitingEmailVerification({Key? key}) : super(key: key);

  @override
  _AwaitingEmailVerificationState createState() =>
      _AwaitingEmailVerificationState();
}

class _AwaitingEmailVerificationState extends State<AwaitingEmailVerification> {
  User? user = FirebaseAuth.instance.currentUser;
  late Timer timer;

  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _checkEmailVerified();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _widgetList = [
      Container(
        decoration: defaultBoxDecoration(color: Colors.green[50]),
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('We have sent an email with a verification link to'
                '\n\n${user!.email}'
                '\n\nPlease tap the link to verify your email address.'),
            const Padding(
              padding: EdgeInsets.all(24.0),
              child: CircularProgressIndicator(
                strokeWidth: 6,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const IntroductionPage()));
              },
              child: const Text('go back'),
            ),
          ],
        ),
      )
    ];
    return PageTemplate(
      heroTag: 'awaiting_verification',
      title: 'Introduction',
      image: 'assets/bluetit1.png',
      widgetList: _widgetList,
    );
  }

  Future<void> _checkEmailVerified() async {
    user = FirebaseAuth.instance.currentUser;
    await user!.reload();
    if (user!.emailVerified) {
      timer.cancel();
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const MyApp()),
          (Route<dynamic> route) => false);
    }
  }
}
