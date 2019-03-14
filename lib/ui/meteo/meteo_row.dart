import 'package:drago_de_piera/models/arpav/previzione_meteo.dart';
import 'package:drago_de_piera/ui/meteo/meteo_card.dart';
import 'package:flutter/material.dart';


class SecondScreen extends StatelessWidget {

  final ArpavMeteo meteo;

  SecondScreen(this.meteo);

  @override
  Widget build (BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(meteo.data),
        ),
        body: new MeteoCard(meteo),
    );
  }
}

class MeteoRow extends StatelessWidget {
  final ArpavMeteo meteo;

  MeteoRow(this.meteo);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Card(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              new MaterialPageRoute(builder: (context) => SecondScreen(this.meteo)),
            );
          },
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(mainAxisSize: MainAxisSize.min, children: [
            Image(
          width: 60.0,
            image: NetworkImage(
                meteo.simbolo),
          ),
              ]),Column(mainAxisSize: MainAxisSize.min, children: [
                Text(this.meteo.data,
                    style: Theme.of(context).textTheme.body2),
              ]),
            ],
          ),
        ),
      ),
    ),
    );
  }
}
