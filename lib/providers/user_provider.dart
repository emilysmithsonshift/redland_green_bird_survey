import 'package:firebase_database/firebase_database.dart';

import '../model/main_model.dart';

BirdBoxUser currentUser;
Future<void> addUserToDB() async {
  final DatabaseReference reference =
      FirebaseDatabase.instance.reference().child("users");
  final String newkey = reference.push().key;
  reference.child(newkey).set({
    'name': currentUser.name,
    'email': currentUser.email,
    'permission': currentUser.permission,
    'nickname': currentUser.nickname
  });
}
