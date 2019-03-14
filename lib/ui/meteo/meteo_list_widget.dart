import 'package:drago_de_piera/models/arpav/previzione_meteo.dart';
import 'package:drago_de_piera/ui/meteo/meteo_row.dart';
import 'package:flutter/material.dart';

class MeteoListWidget extends StatelessWidget {
  Future<List<ArpavMeteo>> future_list = fetchPrevisioniMeteo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<ArpavMeteo>>(
          future: future_list,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var list = snapshot.data;
              return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (BuildContext context, int index) {
                    return MeteoRow(list[index]);
                  });
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            // By default, show a loading spinner
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
