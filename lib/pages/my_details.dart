import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:redland_green_bird_survey/pages/introduction_page.dart';
import 'package:redland_green_bird_survey/widgets/page_template.dart';

class MyDetailsPage extends StatefulWidget {
  @override
  _MyDetailsPageState createState() => _MyDetailsPageState();
}

class _MyDetailsPageState extends State<MyDetailsPage> {
  @override
  Widget build(BuildContext context) {
    Widget _content = Column(
      children: [
        GestureDetector(
          onTap: () {
            FirebaseAuth.instance.signOut();
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => IntroductionPage()));
          },
          child: Text(
            'Logout',
            style: TextStyle(
              color: Colors.red,
            ),
          ),
        )
      ],
    );
    return PageTemplate(
      title: 'My Details',
      image: 'assets/coaltit1.png',
      widgetList: [_content],
      heroTag: 'My details',
    );
  }
}
