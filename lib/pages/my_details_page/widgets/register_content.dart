import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../my_details_controller.dart';

class RegisterContent extends StatefulWidget {
  final MyDetailsController controller;
  const RegisterContent({Key? key, required this.controller}) : super(key: key);

  @override
  _RegisterContentState createState() => _RegisterContentState();
}

class _RegisterContentState extends State<RegisterContent> {
  bool checkBoxValue = true;
  TextEditingController emailController = TextEditingController();
  bool _emailErrorMsg = false;
  TextEditingController passwordController = TextEditingController();
  bool _passwordErrorMsg = false;
  TextEditingController nickNameController = TextEditingController();
  bool _nickNameErrorMsg = false;
  int _currentStep = 0;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    // Example code for registration.
    Future<void> _register() async {
      final FirebaseAuth _auth = FirebaseAuth.instance;

      final User? user = (await _auth
              .createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      )
              .catchError((error) {
        if (kDebugMode) {
          print(error.toString());
        }
        if (error.toString() ==
            '[firebase_auth/email-already-in-use] The email address is already in use by another account.') {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Oh dear'),
                content: Text(
                    "The email address ${emailController.value.text} has already been registered. Please log in."),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      widget.controller.content.value = MyDetailsView.login;
                      Navigator.pop(context);
                    },
                    child: const Text('Continue'),
                  ),
                ],
              );
            },
          );
        } else {
          if (kDebugMode) {
            print(error.toString());
          }
        }
      }))
          .user;

      if (user != null) {
        user.updateDisplayName(nickNameController.value.text);

        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                  "Thank you, ${nickNameController.value.text}, for registering to use this app"),
              content: const Text(
                  "You have been sent an email with a verification link. Please click that link to continue."),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    user.sendEmailVerification();
                    widget.controller.content.value =
                        MyDetailsView.awaitingVerification;
                    Navigator.pop(context);
                  },
                  child: const Text('Continue'),
                ),
              ],
            );
          },
        );
      } else {
        return;
      }
    }

    return Column(children: [
      const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
            'You need to register in order to use this app. We will never share '
            'your details with third parties.'),
      ),
      Stepper(
          currentStep: _currentStep,
          onStepContinue: () async {
            switch (_currentStep) {
              case 0:
                final String email = emailController.value.text;
                if (RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(email)) {
                  setState(() {
                    _emailErrorMsg = false;
                    _currentStep++;
                  });
                } else {
                  setState(() {
                    _emailErrorMsg = true;
                  });
                }
                break;
              case 1:
                if (passwordController.value.text.length > 5) {
                  setState(() {
                    _passwordErrorMsg = false;
                    _currentStep++;
                  });
                } else {
                  setState(() {
                    _passwordErrorMsg = true;
                  });
                }
                break;
              case 2:
                if (nickNameController.value.text.length > 2) {
                  setState(() {
                    _nickNameErrorMsg = false;
                  });
                  setState(() {
                    isLoading == true;
                  });
                  _register();
                } else {
                  setState(() {
                    _nickNameErrorMsg = true;
                  });
                }
                break;
            }
          },
          onStepCancel: () {
            if (_currentStep > 0) {
              setState(() {
                _passwordErrorMsg = false;
                _emailErrorMsg = false;
                _nickNameErrorMsg = false;
                _currentStep--;
              });
            }
          },
<<<<<<< HEAD:lib/pages/my_details_page/widgets/register_content.dart
=======
          // controlsBuilder: (BuildContext context,
          //     {onStepContinue, onStepCancel}) {
          //   return Row(
          //     children: <Widget>[
          //       if (_currentStep > 0)
          //         ElevatedButton(
          //           onPressed: onStepCancel,
          //           child: const Text('Back'),
          //         ),
          //       const SizedBox(width: 20),
          //       ElevatedButton(
          //         onPressed: onStepContinue,
          //         child: _currentStep == 2
          //             ? isLoading == false
          //                 ? Text('Submit')
          //                 : CircularProgressIndicator()
          //             : Text('Next'),
          //       ),
          //     ],
          //   );
          // },
>>>>>>> f7145220ac30b24f80f91788e75572acd6fb1111:lib/pages/registration_page.dart
          steps: [
            Step(
              title: const Text(
                'Please enter your email address',
              ),
              subtitle: _emailErrorMsg
                  ? const Text('Please enter a valid e-mail address',
                      style: TextStyle(
                        color: Colors.red,
                      ))
                  : const Text(''),
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
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration.collapsed(
                      fillColor: Colors.white,
                      hintText: 'eg john_smith@mail.com',
                    ),
                  ),
                ),
              ),
            ),
            Step(
              title: const Text('Please choose a memorable password'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('At least 6 characters'),
                  _passwordErrorMsg
                      ? const Text('Please enter a valid password',
                          style: TextStyle(
                            color: Colors.red,
                          ))
                      : const Text(''),
                ],
              ),
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
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration.collapsed(
                      hintText: '',
                      fillColor: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Step(
              title: const Text(
                'Please choose a nickname (this will be visible to the public)',
              ),
              subtitle: _nickNameErrorMsg
                  ? const Text(
                      'Please choose a nickname with at least 3 characters.',
                      style: TextStyle(
                        color: Colors.red,
                      ))
                  : const Text(''),
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
                    controller: nickNameController,
                    textCapitalization: TextCapitalization.words,
                    decoration: const InputDecoration.collapsed(
                      fillColor: Colors.white,
                      hintText: 'eg Johnny S',
                    ),
                  ),
                ),
              ),
            ),
          ])
    ]);
  }
}
