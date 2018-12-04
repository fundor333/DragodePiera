import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

final String RED_CIRCLE = "🔴";
final String GRAY_CIRCLE = "🔘";
final String UP = "🔺";
final String DOWN = "🔻";
final String TIMEWATCH = "⌚";
final String CALENDAR = "📆";
final String ALLERT = "🌟";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Drago de Piera'),
        ),
        body: Center(
          child: MainFetchData(),
        ),
      ),
    );
  }
}

class Previsione {
  final String data_previsione;
  final String data_estremale;
  final String tipo_estremale;
  final String valore;

  Previsione(
      {this.data_estremale,
        this.data_previsione,
        this.tipo_estremale,
        this.valore});

  factory Previsione.fromJson(Map<String, dynamic> json) {
    var element = json["TIPO_ESTREMALE"];
    var maximum;
    if (element == "max") {
      maximum = UP;
    } else {
      maximum = DOWN;
    }
    String valore;
    if (int.parse(json["VALORE"]) >= 95) {
      valore = json["VALORE"] + ALLERT;
    } else {
      valore = json["VALORE"];
    }

    return Previsione(
      data_previsione: json['DATA_PREVISIONE'],
      data_estremale: json['DATA_ESTREMALE'],
      tipo_estremale: maximum,
      valore: valore,
    );
  }
}

class MainFetchData extends StatefulWidget {
  @override
  _MainFetchDataState createState() => _MainFetchDataState();
}

class _MainFetchDataState extends State<MainFetchData> {
  List<Previsione> list = List();
  var isLoading = false;

  _fetchData() async {
    setState(() {
      isLoading = true;
    });
    final response = await http.get(
        "http://dati.venezia.it/sites/default/files/dataset/opendata/previsione.json");
    if (response.statusCode == 200) {
      list = (json.decode(response.body) as List)
          .map((data) => new Previsione.fromJson(data))
          .toList();
      setState(() {
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load photos');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
                title: new Text(list[index].data_estremale +
                    list[index].tipo_estremale +
                    list[index].valore));
          }),
      floatingActionButton: new FloatingActionButton(
          elevation: 0.0,
          child: new Icon(Icons.file_download),
          backgroundColor: new Color(0xFFE57373),
          onPressed: _fetchData),
    );
  }
}
