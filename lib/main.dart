import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'home_widget.dart';

final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

void main() => runApp(App());

class MaterialAppDrago extends MaterialApp {
  final title = 'Drago de Piera';

  final debugShowCheckedModeBanner = false;

  final theme = ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.indigo[700],
      accentColor: Colors.cyan[600],

      // Define the default Font Family
      fontFamily: 'Montserrat',

      // Define the default TextTheme. Use this to specify the default
      // text styling for headlines, titles, bodies of text, and more.
      textTheme: TextTheme(
        headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
      ),
  );

  final home = Home();
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialAppDrago();
  }
}
