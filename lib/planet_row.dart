import 'package:flutter/material.dart';

class PlanetThumbnail extends Container {
  final marea;

  PlanetThumbnail(this.marea);

  @override
  Container build(BuildContext context) {
    return Container(
        margin: new EdgeInsets.symmetric(vertical: 25.0),
        alignment: FractionalOffset.centerLeft,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              this.marea.tipo_estremale
              ,Text(this.marea.valore)
            ],
          ),


    );
  }
}


class PlanetCard extends Card {
  final marea;

  PlanetCard(this.marea);

  @override
  Container build(BuildContext context) {
    return Container(
      height: 124.0,
      margin: new EdgeInsets.only(left: 46.0),
      decoration: new BoxDecoration(
        color: Theme
            .of(context)
            .primaryColor,
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: new Offset(0.0, 10.0),
          ),
        ],
      ),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(height: 4.0),
          new Text(this.marea.data_estremale ,style: Theme
                .of(context)
                .textTheme
                .display1,
          ),
        ],
      ),
    );
  }
}

class PlanetRow extends StatelessWidget {
  final marea;

  PlanetRow(this.marea);

  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 24.0,
        ),
        child: new Stack(
          children: <Widget>[
            new PlanetCard(this.marea),
            new PlanetThumbnail(this.marea),
          ],
        ));
  }
}
