import 'dart:convert';

import 'package:drago_de_piera/utility.dart';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';

class ArpavMeteo {
  final String simbolo;
  final String cielo;
  final String temperatura;
  final String precipazioni;
  final String probabilita_precipitazione;
  final String neve;
  final String vento;
  final String data;

  ArpavMeteo(this.simbolo, this.cielo, this.temperatura, this.precipazioni,
      this.probabilita_precipitazione, this.neve, this.vento, this.data);

  factory ArpavMeteo.fromJson(Map<String, dynamic> json) {
    print(json);
    final prev = json["previsione"];
    var vento;
    try {
      vento = prev[6]["@value"];
    }catch (e){
      vento = "";

    }
    return ArpavMeteo(
        prev[0]["@value"],
        prev[1]["@value"],
        prev[2]["@value"],
        prev[3]["@value"],
        prev[4]["@value"],
        prev[5]["@value"],
        vento,
        capitalize(json["@data"]));
  }
}

Future<List<ArpavMeteo>> fetchPrevisioniMeteo() async {
  {
    final response = await http.get(
        "http://www.arpa.veneto.it/previsioni/it/xml/bollettino_utenti.xml");
    if (response.statusCode == 200) {
      final Xml2Json myTransformer = Xml2Json();
      myTransformer.parse(response.body);
      return ((json.decode(myTransformer.toBadgerfish())["previsioni"]["meteogrammi"]["meteogramma"][10]["scadenza"] as List)
          .map((data) => new ArpavMeteo.fromJson(data))
          .toList());
    } else {
      throw Exception('Failed to load previsioni');
    }
  }
}
