import 'package:drago_de_piera/models/developer.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class DevCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Container(
          child: GestureDetector(
            onTap: () => _launchURL("https://github.com/" + planet.github),
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: new Stack(
                children: <Widget>[
                  Card(
                    margin: const EdgeInsets.only(top: 20.0),
                    child: SizedBox(
                        height: 100.0,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 45.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                planet.name,
                                style: Theme.of(context).textTheme.subhead,
                              ),
                              Text(planet.role)
                            ],
                          ),
                        )),
                  ),
                  Positioned(
                    top: .0,
                    left: .0,
                    right: .0,
                    child: Center(
                      child: CircleAvatar(
                        radius: 30.0,
                        backgroundImage: NetworkImage(
                            "https://avatars.githubusercontent.com/" +
                                planet.github),

                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  DevCard(this.planet);

  final Developer planet;

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
