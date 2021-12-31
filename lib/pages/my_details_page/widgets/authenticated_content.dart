import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../models/sighting.dart';
import '../../../widgets/observation_widget.dart';
import '../my_details_controller.dart';

class AuthenticatedContent extends StatefulWidget {
  final MyDetailsController controller;
  const AuthenticatedContent({Key? key, required this.controller})
      : super(key: key);

  @override
  State<AuthenticatedContent> createState() => _AuthenticatedContentState();
}

class _AuthenticatedContentState extends State<AuthenticatedContent> {
  List<Sighting> _sightingList = [];
  @override
  Widget build(BuildContext context) {
    _sightingList = Sighting.observations
        .where((sighting) =>
            sighting.userEmail == FirebaseAuth.instance.currentUser!.email)
        .toList();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Nickname: ${FirebaseAuth.instance.currentUser!.displayName}',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            IconButton(
              icon: const Icon(
                Icons.edit,
                size: 20,
                color: Colors.grey,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    TextEditingController controller = TextEditingController(
                        text: FirebaseAuth.instance.currentUser!.displayName);
                    return AlertDialog(
                      title: const Text('Change your nickname'),
                      content: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: controller,
                          keyboardType: TextInputType.name,
                        ),
                      ),
                      actions: [
                        ElevatedButton(
                          onPressed: () async {
                            await FirebaseAuth.instance.currentUser!
                                .updateDisplayName(controller.value.text);
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/goldfinch1.png'),
              ),
            ),
            height: 100,
            width: 100,
          ),
        ),
        const Text(
          'My observations',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        _sightingList.isEmpty
            ? const Padding(
                padding: EdgeInsets.all(8.0),
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
              ),
        TextButton(
          onPressed: () {
            FirebaseAuth.instance.signOut();

            widget.controller.content.value = MyDetailsView.unauthenticated;
          },
          child: const Text(
            'Logout',
            style: TextStyle(
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}
