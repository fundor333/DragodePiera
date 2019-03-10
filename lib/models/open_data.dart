class OpenData {
  final url;
  final title;
  final text;
  final img;

  OpenData(this.url, this.title, this.text, this.img);
}

final source_code = OpenData(
    "https://github.com/samarcandaproject/DragodePiera",
    "Drago di Piera",
    "Codice sorgente per l'app che hai in mano",
    "https://avatars.githubusercontent.com/samarcandaproject");

final centro_maree = OpenData(
    "http://dati.venezia.it/?q=content/cpsm-dati-meteomarini-laguna-e-litorale-veneziano",
    "Dati maree",
    "Dati del centro maree",
    "https://intranet.comune.venezia.it/system/files/4/images/cittadive.png");

final arpav_allergeni = OpenData(
    "http://www.arpa.veneto.it/dati-ambientali/open-data",
    "Arpav",
    "Dati meteorogici e allergeni Veneto",
    "http://www.arpa.veneto.it/notizie/in-primo-piano/on-line-i-dati-in-revisione-esterna-di-inemar-veneto-2015-l2019inventario-regionale-delle-emissioni-in-atmosfera/image_tile");
