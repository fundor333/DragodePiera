import 'package:drago_de_piera/models/open_data.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatelessWidget {
  final OpenData opendata;

  ProjectCard(this.opendata);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GestureDetector(
      onTap: () => _launchURL(opendata.url),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: new Stack(
          children: <Widget>[
            Card(
              elevation: 4.0,
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
                          opendata.title,
                          style: Theme.of(context).textTheme.subhead,
                        ),
                        Text(
                          opendata.text,
                          style: Theme.of(context).textTheme.subhead,
                        )
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
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(opendata.img),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
