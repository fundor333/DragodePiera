import 'package:drago_de_piera/ui/about_widget.dart';
import 'package:drago_de_piera/ui/landing_widget.dart';
import 'package:drago_de_piera/ui/marea_widget.dart';
import 'package:drago_de_piera/ui/meteo_widget.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

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
    MeteoWidget(),
    AboutWidget()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        items: <Widget>[
          Icon(Icons.dashboard),
          Icon(Icons.broken_image),
          Icon(Icons.wb_sunny),
          Icon(Icons.info),
        ],

        color: Theme.of(context).primaryColor,
        backgroundColor: Colors.grey[850],

        onTap: (index) {
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
