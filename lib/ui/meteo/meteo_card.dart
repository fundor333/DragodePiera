import 'package:drago_de_piera/models/arpav/previzione_meteo.dart';
import 'package:flutter/material.dart';

class MeteoCard extends StatelessWidget {
  final ArpavMeteo meteo;

  MeteoCard(this.meteo);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Center(
                child: Image(
                  image: NetworkImage(meteo.simbolo),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    meteo.data,
                    style: Theme.of(context).textTheme.body2,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  meteo.cielo,
                  style: Theme.of(context).textTheme.subtitle,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Temperatura corrente " + meteo.temperatura,
                  style: Theme.of(context).textTheme.body1,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Precipitazioni " + meteo.precipazioni,
                  style: Theme.of(context).textTheme.subtitle,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Probabilitá di precipitazioni " +
                      meteo.probabilita_precipitazione,
                  style: Theme.of(context).textTheme.subtitle,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Vento " + meteo.vento,
                  style: Theme.of(context).textTheme.subtitle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
