import 'package:drago_de_piera/models/developer.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Drago de Piera',
                    style: Theme.of(context).textTheme.title,
                  ),
                ),
                Text(
                  'by Fundor333',
                  style: Theme.of(context).textTheme.body2,
                ),
              ],
            ),
          ),
        ],
      ),
    );

    Column buildButtonColumn(IconData icon, String label) {
      Color color = Theme.of(context).primaryColor;

      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: Text(
              label,
              style: Theme.of(context).textTheme.body1,
            ),
          ),
        ],
      );
    }

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [],
      ),
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Text(
        '''
Ciao. Questa é un app che é stata costruita basandosi sugli OpenData del Comune di Venezia e del Centro Previsioni e Segnalazioni Maree di Venezia.
        ''',
        softWrap: true,
        style: Theme.of(context).textTheme.body1,
      ),
    );

    Widget devlist = DevListRow(devs[0]);

    return Scaffold(
        body: ListView(
      children: [
        titleSection,
        buttonSection,
        textSection,
        devlist,
      ],
    ));
  }
}

class DevListRow extends StatelessWidget {
  DevListRow(this.planet);

  final Developer planet;

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget build(BuildContext context) {
    final planetThumbnail = new Container(
        margin: new EdgeInsets.symmetric(vertical: 16.0),
        alignment: FractionalOffset.centerLeft,
        child: GestureDetector(
          onTap: () =>_launchURL("https://github.com/" + planet.github),
          child: new Image(
            image: NetworkImage(
                "https://avatars.githubusercontent.com/" + planet.github),
            height: 92.0,
            width: 92.0,
          ),
        ));

    final planetCardContent = new Container(
      margin: new EdgeInsets.fromLTRB(76.0, 16.0, 16.0, 16.0),
      constraints: new BoxConstraints.expand(),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(height: 4.0),
          new Text(
            planet.name,
          ),
          new Container(height: 10.0),
          new Text(
            planet.name,
          ),
          new Container(
              margin: new EdgeInsets.symmetric(vertical: 8.0),
              height: 2.0,
              width: 18.0,
              color: new Color(0xff00c6ff)),
        ],
      ),
    );

    return new Container(
        height: 120.0,
        margin: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 24.0,
        ),
        child: new Stack(
          children: <Widget>[
            planetCardContent,
            planetThumbnail,
          ],
        ));
  }
}
