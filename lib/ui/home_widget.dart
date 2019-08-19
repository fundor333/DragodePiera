import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:drago_de_piera/ui/about_widget.dart';
import 'package:drago_de_piera/ui/landing_widget.dart';
import 'package:drago_de_piera/ui/marea/marea_widget.dart';
import 'package:drago_de_piera/ui/meteo/meteo_list_widget.dart';
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
    MeteoListWidget(),
    AboutWidget()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        items: <Widget>[
          Icon(Icons.dashboard, color: Colors.white,),
          Icon(Icons.broken_image, color: Colors.white,),
          Icon(Icons.wb_sunny, color: Colors.white,),
          Icon(Icons.info, color: Colors.white,),
        ],
        color: Theme.of(context).primaryColor,
        backgroundColor: Colors.white,
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
