import 'dart:convert';

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

  ArpavMeteo(this.simbolo, this.cielo, this.temperatura, this.precipazioni,
      this.probabilita_precipitazione, this.neve, this.vento);

  factory ArpavMeteo.fromJson(Map<String, dynamic> json) {
    return ArpavMeteo(
        "http://www.arpa.veneto.it/previsioni/images/meteosymbols/a3.png",
        "Parzialmente nuvoloso per nubi alte",
        "max 11/13 C",
        "Assenti",
        "0%",
        "",
        "Moderati da nordest");
  }
}

Future<ArpavMeteo> fetchPrevisioniMeteo() async {
  {
    final response = await http.get(
        "http://www.arpa.veneto.it/previsioni/it/xml/bollettino_utenti.xml");
    if (response.statusCode == 200) {
      final Xml2Json myTransformer = Xml2Json();
      myTransformer.parse(response.body);
      return new ArpavMeteo.fromJson(json.decode(myTransformer.toBadgerfish()));
    } else {
      throw Exception('Failed to load previsioni');
    }
  }
}
