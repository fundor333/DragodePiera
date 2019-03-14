import 'package:drago_de_piera/models/previsione_marea.dart';
import 'package:flutter/material.dart';

class MareaCard extends StatelessWidget {
  final Previsione marea;

  MareaCard(this.marea);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(mainAxisSize: MainAxisSize.min, children: [
                this.marea.tipo_estremale,
              ]),Column(mainAxisSize: MainAxisSize.min, children: [
                Text(this.marea.valore + " cm ",
                    style: Theme.of(context).textTheme.title),
              ]),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(marea.data_estremale,
                      style: Theme.of(context).textTheme.subtitle),
                  Text(marea.ora_estremale,
                      style: Theme.of(context).textTheme.subtitle)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
