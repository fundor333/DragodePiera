import 'dart:convert';

import 'package:http/http.dart' as http;

final String RED_CIRCLE = "🔴";
final String GRAY_CIRCLE = "🔘";
final String UP = "🔺";
final String DOWN = "🔻";
final String TIMEWATCH = "⌚";
final String CALENDAR = "📆";
final String ALLERT = "🌟";

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
