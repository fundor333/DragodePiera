import 'package:drago_de_piera/models/arpav/previzione_meteo.dart';
import 'package:flutter/material.dart';

class MeteoWidget extends StatelessWidget {
  Future<ArpavMeteo> future_list = fetchPrevisioniMeteo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<ArpavMeteo>(
          future: future_list,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return MeteoCard(snapshot.data);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            // By default, show a loading spinner
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

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
                padding: EdgeInsets.all(20.0),
                child: Text(
                  meteo.cielo,
                  style: Theme.of(context).textTheme.subtitle,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "Temperatura corrente " + meteo.temperatura,
                  style: Theme.of(context).textTheme.body2,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "Precipitazioni " + meteo.precipazioni,
                  style: Theme.of(context).textTheme.subtitle,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "Probabilitá di precipitazioni " +
                      meteo.probabilita_precipitazione,
                  style: Theme.of(context).textTheme.subtitle,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
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
