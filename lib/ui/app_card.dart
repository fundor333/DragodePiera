import 'package:drago_de_piera/ui/squared_image.dart';
import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget textSection = Container(
      padding: const EdgeInsets.all(15.0),
      child: Center(
        child: Text(
          '''
Ciao! Questa é un app che é stata costruita basandosi sugli OpenData del Comune di Venezia e del Centro Previsioni e Segnalazioni Maree di Venezia. Stiamo lavorando per implementare altre fonti per potenziare quest'app
        ''',
          style: Theme.of(context).textTheme.body1,
        ),
      ),
    );

    return Padding(
      padding: EdgeInsets.all(40.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Drago de Piera",
              style: Theme.of(context).textTheme.title,
            ),
            textSection,
            Container(
              child: Center(
                child: SquaredStaticImageShadow(
                    radius: 120.0,
                    backgroundImage: "assets/img/logo.png",
                backgroundColor: Colors.white,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
