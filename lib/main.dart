import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'home_widget.dart';

final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drago de Piera',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
