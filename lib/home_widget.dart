import 'package:flutter/material.dart';

import 'about_widget.dart';
import 'landing_widget.dart';
import 'marea_widget.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    LandingWidget(),
    MeraeWidget(),
    AboutWidget()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drago de Piera'),
      ),
      body: _children[_currentIndex], // new
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            title: Text('DashBoard'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.broken_image),
            title: Text('Marea'),
          ),
          new BottomNavigationBarItem(
              icon: Icon(Icons.info), title: Text('Info'))
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
