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
    final prev = json["previsione"];
    var vento;
    var now = new DateTime.now();
    var dateJson = capitalize(json["@data"]).replaceAll("  ",  " ").split(" ");
    if (now.day > int.parse(dateJson[1])){return null;}
    print(dateJson[3]);
    if (now.day == int.parse(dateJson[1]) && now.hour>12 && dateJson[3]=="mattina"){return null;}


    try {
      vento = prev[6]["@value"];
    } catch (e) {
      vento = "assente";
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
      var a =  ((json.decode(myTransformer.toBadgerfish())["previsioni"]
              ["meteogrammi"]["meteogramma"][10]["scadenza"] as List)
          .map((data) => new ArpavMeteo.fromJson(data))
          .toList());
      a.removeWhere((value) => value == null);
      return a;
    } else {
      throw Exception('Failed to load previsioni');
    }
  }
}
