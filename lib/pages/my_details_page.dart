import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:redland_green_bird_survey/models/sighting.dart';
import 'package:redland_green_bird_survey/pages/introduction_page.dart';
import 'package:redland_green_bird_survey/widgets/observation_widget.dart';
import 'package:redland_green_bird_survey/widgets/page_template.dart';

class MyDetailsPage extends StatefulWidget {
  @override
  _MyDetailsPageState createState() => _MyDetailsPageState();
}

class _MyDetailsPageState extends State<MyDetailsPage> {
  List<Sighting> _sightingList = [];

  @override
  Widget build(BuildContext context) {
    _sightingList = Sighting.sightings
        .where((sighting) =>
            sighting.userEmail == FirebaseAuth.instance.currentUser.email)
        .toList();
    Widget _content = Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Nickname: ${FirebaseAuth.instance.currentUser.displayName}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            IconButton(
              icon: Icon(
                Icons.edit,
                color: Colors.grey,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    TextEditingController controller = TextEditingController(
                        text: FirebaseAuth.instance.currentUser.displayName);
                    return AlertDialog(
                      title: Text('Change your nickname'),
                      content: Container(
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(5.0, 5.0),
                              blurRadius: 5.0,
                            )
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: controller,
                            keyboardType: TextInputType.name,
                          ),
                        ),
                      ),
                      actions: [
                        ElevatedButton(
                          onPressed: () async {
                            await FirebaseAuth.instance.currentUser
                                .updateProfile(
                                    displayName: controller.value.text);
                            Navigator.pop(context);
                          },
                          child: const Text('Ok'),
                        ),
                      ],
                    );
                  },
                ).then((value) {
                  setState(() {});
                });
              },
            ),
          ],
        ),
        TextButton(
          onPressed: () {
            FirebaseAuth.instance.signOut();
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => IntroductionPage(),
              ),
              (Route<dynamic> route) => false,
            );
          },
          child: Text(
            'Logout',
            style: TextStyle(
              color: Colors.red,
            ),
          ),
        ),
        Text(
          'My observations',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        _sightingList.isEmpty
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('You have no observations yet.'),
              )
            : Column(
                children: _sightingList.map((Sighting sighting) {
                  return observationDetails(
                      sighting: sighting,
                      context: context,
                      showBoxNo: true,
                      showUser: false,
                      setState: () {
                        setState(() {});
                      });
                }).toList(),
              )
      ],
    );
    return PageTemplate(
      title: 'My Details',
      image: 'assets/coaltit1.png',
      widgetList: [_content],
      heroTag: 'my_details',
    );
  }
}
