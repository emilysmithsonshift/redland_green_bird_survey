import 'package:flutter/material.dart';

import 'pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Redland Green Bird Survey',
      home: HomePage(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
