import 'package:drago_de_piera/ui/about_widget.dart';
import 'package:drago_de_piera/ui/landing_widget.dart';
import 'package:drago_de_piera/ui/marea_widget.dart';
import 'package:flip_box_bar/flip_box_bar.dart';
import 'package:flutter/material.dart';

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
    MareaWidget(),
    AboutWidget()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FlipBoxBar(
        items: [
          FlipBarItem(
              icon: Icon(Icons.dashboard),
              text: Text("DashBoard"),
              frontColor: Theme.of(context).primaryColor,
              backColor: Theme.of(context).primaryColor),
          FlipBarItem(
              icon: Icon(Icons.broken_image),
              text: Text("Marea"),
              frontColor: Theme.of(context).primaryColor,
              backColor: Theme.of(context).primaryColor),
          FlipBarItem(
              icon: Icon(Icons.info),
              text: Text("Info"),
              frontColor: Theme.of(context).primaryColor,
              backColor: Theme.of(context).primaryColor),
        ],
        onIndexChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),

      appBar: AppBar(
        title: Text('Drago de Piera'),
      ),
      body: _children[_currentIndex], // new
    );
  }

  void onTabTapped(int index) {}
}
