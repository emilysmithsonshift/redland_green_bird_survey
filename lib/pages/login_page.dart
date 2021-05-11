import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:redland_green_bird_survey/widgets/page_template.dart';

import '../main.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  String emailErrorMsg = '';
  String passwordErrorMsg = '';
  String errorMsg = '';
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetList = [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Enter your email address'),
            const SizedBox(height: 8),
            Text(
              emailErrorMsg,
              style: const TextStyle(color: Colors.red),
            ),
            Container(
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
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration.collapsed(
                    fillColor: Colors.white,
                    hintText: 'eg john_smith@mail.com',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text('Enter your password'),
            Text(
              passwordErrorMsg,
              style: const TextStyle(color: Colors.red),
            ),
            Container(
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
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration.collapsed(
                    hintText: '',
                    fillColor: Colors.white,
                  ),
                ),
              ),
            ),
            Text(
              errorMsg,
              style: const TextStyle(color: Colors.red),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });
                    final String email = emailController.value.text;
                    if (RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(email)) {
                      setState(() {
                        isLoading = false;
                        emailErrorMsg = '';
                      });
                    } else {
                      setState(() {
                        isLoading = false;
                        emailErrorMsg = 'Please enter a valid e-mail address';
                      });
                      return;
                    }
                    if (passwordController.value.text.length < 6) {
                      setState(() {
                        isLoading = false;
                        passwordErrorMsg =
                            'Please enter your password (at least 6 characters)';
                      });
                      return;
                    } else {
                      passwordErrorMsg = '';
                    }

                    final FirebaseAuth _auth = FirebaseAuth.instance;
                    final UserCredential _user = await _auth
                        .signInWithEmailAndPassword(
                            email: emailController.value.text,
                            password: passwordController.value.text)
                        .catchError((error, stacktrace) {
                      setState(() {
                        isLoading = false;
                        errorMsg = error.message;
                      });
                      return;
                    });
                    if (_user != null) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => MyApp(),
                        ),
                        (Route<dynamic> route) => false,
                      );
                    }
                  },
                  child:
                      isLoading ? CircularProgressIndicator() : Text('Submit'),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: 200,
                child: OutlineButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                    setState(() {
                      emailErrorMsg = '';
                    });

                    final FirebaseAuth _auth = FirebaseAuth.instance;
                    _auth
                        .sendPasswordResetEmail(
                            email: emailController.value.text)
                        .catchError((error) {
                      if (error.toString() ==
                          '[firebase_auth/user-not-found] There is no user record corresponding to this identifier. The user may have been deleted.') {
                        setState(() {
                          emailErrorMsg =
                              'There is no record of this email address. The user may have been deleted. Please re-register.';
                          return;
                        });
                      } else if (error.toString().isNotEmpty) {
                        setState(() {
                          emailErrorMsg = 'Please enter a valid email address';
                          return;
                        });
                      }
                      if (error.toString().isEmpty) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text(
                                  "Please check your email for a password reset message"),
                              content: const Text(
                                  "Once you have reset your password you should be able to log in here."),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Ok'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    });
                  },
                  child: const Text('Forgotten Password?',
                      style: TextStyle(color: Colors.grey)),
                ),
              ),
            ),
          ],
        ),
      ),
    ];
    return PageTemplate(
      title: 'Login Page',
      image: 'assets/robin1.png',
      widgetList: widgetList,
      heroTag: 'robin',
    );
  }
}
