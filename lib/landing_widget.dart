import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;

class LandingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: MainFetchData(),
        ),
      ),
    );
  }
}


class MainFetchData extends StatefulWidget {
  @override
  _MainFetchDataState createState() => _MainFetchDataState();
}

class _MainFetchDataState extends State<MainFetchData> {
  String marea_attuale = "";
  var isLoading = false;

  @override
  void initState() {
    _get_data();
  }


  _get_data() async {
    setState(() {
      isLoading = true;
    });
    http.Response response = await http.get(
        'http://actv.avmspa.it/it/content/acqua-alta-servizi-di-navigazione-previsti');
    dom.Document document = parser.parse(response.body);
    marea_attuale =
        document.getElementsByTagName('actvtide-value-content--number')[0]
            .toString();

    setState(() {
      isLoading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: isLoading
            ?  Center(child: Text(
          "Test della pagina in corso\nAttualmente la marea é di 0 cm",
          style: TextStyle(
            color: Colors.black,
          ),
        ))
            : Center(child: Text(
          marea_attuale + " cm",
          style: TextStyle(
            color: Colors.grey[500],
          ),
        ))
    );
  }
}
