import 'package:drago_de_piera/models/developer.dart';
import 'package:drago_de_piera/ui/dev_card.dart';
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

    Widget devlist = DevCard(devs[0]);

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

