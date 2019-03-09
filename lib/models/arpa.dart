import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';


class Arpa {
  final String data_previsione;
  final String ora_previsione;
  final String data_estremale;
  final String ora_estremale;
  final IconButton tipo_estremale;
  final String valore;

  Arpa(this.data_previsione, this.ora_previsione, this.data_estremale,
      this.ora_estremale, this.tipo_estremale, this.valore);

  factory Arpa.fromJson(Map<String, dynamic> json) {
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

    return Arpa(
      json['DATA_PREVISIONE'].split(' ')[0],
      json['DATA_PREVISIONE'].split(' ')[1],
      json['DATA_ESTREMALE'].split(' ')[0],
      json['DATA_ESTREMALE'].split(' ')[1],
      maximum,
      valore,
    );
  }
}

Future<Arpa> fetchPrevisioni() async {
  {
    final Xml2Json myTransformer = Xml2Json();
    final response = await http.get(
        "http://www.arpa.veneto.it/bollettini/meteo/h24/img11/0160.xml");
    if (response.statusCode == 200) {
      myTransformer.parse(response.body);
      String json_out = myTransformer.toBadgerfish();
      return new Arpa.fromJson(json.decode(json_out)));
    } else {
      throw Exception('Failed to load previsioni');
    }
  }
}

