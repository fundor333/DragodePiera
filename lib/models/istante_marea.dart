import 'dart:async';

import 'package:html/parser.dart' show parse;
import 'package:http/http.dart' as http;

class IstanteMarea {
  final String valore;

  IstanteMarea(this.valore);

  factory IstanteMarea.from_url(String json) {
    var document = parse(json);
    var last = "";

    for (var i = 0; document.querySelector("table").children[2].children.length > i; i++) {
      var element = document.querySelector("table").children[2].children[i];
      if (element.children[2].text == "") {
        print(last);
        return IstanteMarea(last);
      } else {
        last = element.querySelectorAll("td")[2].text;
      }
    }
    return IstanteMarea(document.querySelectorAll("tr")[0].text);
  }
}

Future<IstanteMarea> get_istante_marea() async {
  {
    final response = await http
        .get("http://93.62.201.235/maree/ESPORTAZIONI/DATI/Punta_Salute.html");
    if (response.statusCode == 200) {
      return new IstanteMarea.from_url(response.body);
    } else {
      throw Exception('Failed to load previsioni');
    }
  }
}
