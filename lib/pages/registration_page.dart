import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:redland_green_bird_survey/pages/home.dart';
import 'package:redland_green_bird_survey/widgets/page_template.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool checkBoxValue = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nickNameController = TextEditingController();
  int _currentStep = 0;
  @override
  Widget build(BuildContext context) {
    // Example code for registration.
    Future<void> _register() async {
      final FirebaseAuth _auth = FirebaseAuth.instance;
      final User user = (await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      ))
          .user;
      if (user != null) {
        user.updateProfile(displayName: nickNameController.value.text);

        // set up the AlertDialog
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Thank you for registering to use this app"),
              content: const Text(
                  "You will now be able to enter your own observations"),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => HomePage(),
                      ),
                    );
                  },
                  child: const Text('Continue'),
                ),
              ],
            );
            ;
          },
        );
      } else {
        return false;
      }
    }

    final List<Widget> _widgetList = [
      Stepper(
          currentStep: _currentStep,
          onStepContinue: () async {
            switch (_currentStep) {
              case 0:
                print(nameController.value.text.isNotEmpty);
                if (nameController.value.text.length > 2) {
                  setState(() {
                    _currentStep++;
                  });
                }
                break;
              case 1:
                final String email = emailController.value.text;
                if (RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(email)) {
                  setState(() {
                    _currentStep++;
                  });
                }
                break;
              case 2:
                if (passwordController.value.text.length > 5) {
                  setState(() {
                    _currentStep++;
                  });
                }
                break;
              case 3:
                if (nickNameController.value.text.length > 2) {
                  setState(() {
                    _currentStep++;
                  });
                }
                break;
              case 4:
                _register();

                break;
            }
          },
          onStepCancel: () {
            if (_currentStep > 0) {
              setState(() {
                _currentStep--;
              });
            }
          },
          controlsBuilder: (BuildContext context,
              {onStepContinue, onStepCancel}) {
            return Row(
              children: <Widget>[
                if (_currentStep > 0)
                  ElevatedButton(
                    onPressed: onStepCancel,
                    child: const Text('BACK'),
                  ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: onStepContinue,
                  child: const Text('NEXT'),
                ),
              ],
            );
          },
          steps: [
            Step(
              title: const Text(
                'Please enter your full name',
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
                    controller: nameController,
                    textCapitalization: TextCapitalization.words,
                    decoration: const InputDecoration.collapsed(
                      fillColor: Colors.white,
                      hintText: 'eg John Smith',
                    ),
                  ),
                ),
              ),
            ),
            Step(
              title: const Text(
                'Please enter your email address',
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
              subtitle: const Text('At least 6 characters'),
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
            Step(
              title: const Text('May we keep in touch?'),
              subtitle: const Text(
                'We may wish to get in contact with you to tell you about the results of the survey'
                ' or about other apps or events on Redland Green. '
                'We will never pass your details to third parties.  ',
              ),
              content: CheckboxListTile(
                title: checkBoxValue
                    ? const Text("Yes, please keep me up to date.")
                    : const Text('No, please do not contact me.'),
                value: checkBoxValue,
                onChanged: (newValue) {
                  setState(() {
                    checkBoxValue = !checkBoxValue;
                  });
                },
                controlAffinity:
                    ListTileControlAffinity.leading, //  <-- leading Checkbox
              ),
            ),
          ])
    ];

    return PageTemplate(
      title: 'Welcome',
      image: 'assets/robin1.png',
      heroTag: 'registration',
      widgetList: _widgetList,
    );
  }
}
