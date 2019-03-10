import 'package:drago_de_piera/models/previsione_marea.dart';
import 'package:drago_de_piera/ui/marea_card.dart';
import 'package:flutter/material.dart';

class MareaWidget extends StatelessWidget {
  Future<List<Previsione>> future_list = fetchPrevisioni();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<Previsione>>(
          future: future_list,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var list = snapshot.data;
              return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (BuildContext context, int index) {
                    return MareaCard(list[index]);
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
