import 'package:drago_de_piera/models/developer.dart';
import 'package:drago_de_piera/ui/dev_card.dart';
import 'package:drago_de_piera/ui/project_card.dart';
import 'package:flutter/material.dart';

class AboutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.only(top:32.0),
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: Text(
                'Drago de Piera',
                style: Theme.of(context).textTheme.title,
              ),
            ),
          ),
        ],
      ),
    );

    Widget projectGithub = ProjectCard();


    Widget titleDev = Container(
      padding: const EdgeInsets.symmetric(horizontal:32.0),
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
        projectGithub,
        titleDev,
        devlist,
      ],
    ));
  }
}
