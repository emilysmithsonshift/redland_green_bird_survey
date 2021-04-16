import 'package:flutter/material.dart';
import 'package:redland_green_bird_survey/widgets/page_template.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetList = [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Text(
                'What is your full name?',
                textAlign: TextAlign.start,
              ),
            ),
            Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  new BoxShadow(
                    color: Colors.grey,
                    offset: new Offset(5.0, 5.0),
                    blurRadius: 5.0,
                  )
                ],
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration.collapsed(
                    fillColor: Colors.white,
                    hintText: 'eg John Smith',
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: Text(
                'What is your email address?',
                textAlign: TextAlign.start,
              ),
            ),
            Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  new BoxShadow(
                    color: Colors.grey,
                    offset: new Offset(5.0, 5.0),
                    blurRadius: 5.0,
                  )
                ],
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration.collapsed(
                    fillColor: Colors.white,
                    hintText: 'eg john_smiths@mail.com',
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: Text(
                'What would you like your nickname to be (this will be visible to the public?',
                textAlign: TextAlign.start,
              ),
            ),
            Container(
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    new BoxShadow(
                      color: Colors.grey,
                      offset: new Offset(5.0, 5.0),
                      blurRadius: 5.0,
                    )
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration.collapsed(
                      fillColor: Colors.white,
                      hintText: 'eg Johnny',
                    ),
                  ),
                ))
          ],
        ),
      ),
    ];
    return PageTemplate(
      title: 'Welcome',
      image: 'assets/robin1.png',
      heroTag: 'registration',
      widgetList: _widgetList,
    );
  }
}
