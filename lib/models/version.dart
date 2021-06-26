import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Version {
  static final String currentVersion = '1.0.6+7';

  static Future checkVersion(BuildContext context) async {
    final DatabaseReference reference =
        FirebaseDatabase.instance.reference().child("version");
    final DataSnapshot snapshot = await reference.once();
    if (snapshot.value == null) {
      return true;
    }
    final String latestVersion = snapshot.value;
    if (latestVersion != currentVersion) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Material(
            child: AlertDialog(
              title: Text('Please update your app'),
              content: Text(
                  "You are not currently using the latest version of the app. "
                  "\n\nPlease download the latest version from the app store."),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("No thanks"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    {
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
                    }
                  },
                  child: const Text('Go to app store'),
                ),
              ],
            ),
          );
        },
      );
    }
  }
}
