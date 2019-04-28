import 'package:drago_de_piera/models/developer.dart';
import 'package:drago_de_piera/models/open_data.dart';
import 'package:drago_de_piera/ui/app_card.dart';
import 'package:drago_de_piera/ui/dev_card.dart';
import 'package:drago_de_piera/ui/project_card.dart';
import 'package:flutter/material.dart';

class AboutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = AppCard();

    Widget openDev = Container(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: Text(
                'I nostri Open Data',
                style: Theme.of(context).textTheme.display1,
              ),
            ),
          ),
        ],
      ),
    );

    Widget projectGithub = ProjectCard(source_code);
    Widget centroMaree = ProjectCard(centro_maree);
    Widget arpavAllergeni = ProjectCard(arpav_allergeni);

    Widget titleDev = Container(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: Text(
                'Il nostro Team',
                style: Theme.of(context).textTheme.display1,
              ),
            ),
          ),
        ],
      ),
    );

    Widget devlist = DevCard(fundor333);

    return Scaffold(
        body: ListView(
      children: [
        titleSection,
        openDev,
        projectGithub,
        centroMaree,
        arpavAllergeni,
        titleDev,
        devlist,
      ],
    ));
  }
}
