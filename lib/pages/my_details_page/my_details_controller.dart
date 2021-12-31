import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

enum MyDetailsView {
  authenticated,
  unauthenticated,
  login,
  register,
}

class MyDetailsController {
  final ValueNotifier<MyDetailsView> content =
      ValueNotifier<MyDetailsView>(MyDetailsView.unauthenticated);
  initialise() {
    if (FirebaseAuth.instance.currentUser == null) {
      content.value = MyDetailsView.unauthenticated;
    } else {
      content.value = MyDetailsView.authenticated;
    }
  }
}
