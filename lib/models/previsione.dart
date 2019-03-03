import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

final String RED_CIRCLE = "🔴";
final String GRAY_CIRCLE = "🔘";
final  UP = IconButton(
    icon: Icon(Icons.trending_up),
    tooltip: 'Massimale',
    onPressed: () {});

final DOWN = IconButton(
    icon: Icon(Icons.trending_down),
    tooltip: 'Minimale',
    onPressed: () {});
final String TIMEWATCH = "⌚";
final String CALENDAR = "📆";
final String ALLERT = "🌟";

class Previsione {
  final String data_previsione;
  final String ora_previsione;
  final String data_estremale;
  final String ora_estremale;
  final IconButton tipo_estremale;
  final String valore;


  Previsione(this.data_previsione, this.ora_previsione, this.data_estremale,
      this.ora_estremale, this.tipo_estremale, this.valore);

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
       json['DATA_PREVISIONE'].split(' ')[0],
       json['DATA_PREVISIONE'].split(' ')[1],
       json['DATA_ESTREMALE'].split(' ')[0],
       json['DATA_ESTREMALE'].split(' ')[1],
       maximum,
       valore,
    );
  }
}

Future<List<Previsione>> fetchPrevisioni() async {
  {
    final response = await http.get(
        "http://dati.venezia.it/sites/default/files/dataset/opendata/previsione.json");
    if (response.statusCode == 200) {
      return ((json.decode(response.body) as List)
          .map((data) => new Previsione.fromJson(data))
          .toList());
    } else {
      throw Exception('Failed to load previsioni');
    }
  }
}
