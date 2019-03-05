import 'package:drago_de_piera/models/previsione.dart';
import 'package:flutter/material.dart';

class MareaIcon extends Container {
  final marea;

  MareaIcon(this.marea);

  @override
  Container build(BuildContext context) {
    return Container(
      margin: new EdgeInsets.symmetric(vertical: 25.0),
      alignment: FractionalOffset.centerLeft,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[this.marea.tipo_estremale, Text(this.marea.valore)],
      ),
    );
  }
}

class MareaCard extends Card {
  final marea;

  MareaCard(this.marea);

  @override
  Card build(BuildContext context) {
    return Card(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Container(
              alignment: FractionalOffset.centerLeft,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  this.marea.tipo_estremale,
                  Text(this.marea.valore)
                ],
              ),
            ),
            new Container(
                child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Container(height: 4.0),
                      new Text(
                        this.marea.data_estremale,
                        style: Theme.of(context).textTheme.display1,
                      ),
                      new Text(
                        this.marea.ora_estremale,
                        style: Theme.of(context).textTheme.display1,
                      ),
                    ])),
          ],
        ));
  }
}

class MareaRow extends StatelessWidget {
  final marea;

  MareaRow(this.marea);

  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 24.0,
        ),
        child: new Stack(
          children: <Widget>[
            new MareaCard(this.marea),
          ],
        ));
  }
}

class MareaWidget extends StatelessWidget {
  Future<List<Previsione>> future_list = fetchPrevisioni();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Scaffold(
              body: Center(
            child: FutureBuilder<List<Previsione>>(
              future: future_list,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var list = snapshot.data;
                  return ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (BuildContext context, int index) {
                        return MareaRow(list[index]);});
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                // By default, show a loading spinner
                return CircularProgressIndicator();
              },
            ),
          )),
        ),
    );
  }
}
