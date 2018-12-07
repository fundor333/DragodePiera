import 'package:drago_de_piera/models/previsione.dart';
import 'package:flutter/material.dart';

class MeraeWidget extends StatelessWidget {
  Future<List<Previsione>> future_list = fetchPrevisioni();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
                        return ListTile(
                            title: new Text(list[index].data_estremale +
                                list[index].tipo_estremale +
                                list[index].valore));
                      });
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                // By default, show a loading spinner
                return CircularProgressIndicator();
              },
            ),
          )),
        ),
      ),
    );
  }
}
