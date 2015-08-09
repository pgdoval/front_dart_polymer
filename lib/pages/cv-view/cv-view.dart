@HtmlImport('cv-view.html')
library polymer_core_and_paper_examples.spa.app;

import 'package:polymer/polymer.dart';
import 'dart:html';

@CustomTag('cv-view')
class CvView extends PolymerElement {
  
  @observable Map<String,Object> data;
  
  CvView.created() : super.created(){
    data = obtainData(); 
    print(this.data);
  }
  
  Map<String,Object> obtainData(){
    return {
      "name":"Pablo",
      "surname":"González Doval",
      "description":"Responsable de desarrollo. Scrum Master. Gestión de equipos.\n"+
      "Programador full-stack. Groovy/Grails, Javascript, Backbone, Dart...\n\n"+
      "También tengo amplia experiencia en Business Intelligence y mantenimiento de BBDD.\n"+
      "Mi objetivo es seguir ampliando horizontes, profundizando en mis conocimientos y aprendiendo nuevas tecnologías, metodologías y habilidades en general.",
      "photo":"pablo.jpg",
      "jobs":[
        {
          "company": "YUMP",
          "position": "Responsable de desarrollo",
          "company-logo": "yump.jpg",
          "description": "Liderazgo técnico del proyecto YUMP. Gestión del equipo de desarrollo\n"+
          "Mantenimiento, rediseño y aumento de funcionalidad de una plataforma basada en API REST. El backend se realiza básicamente en Groovy/Grails, mientras que el frontend utiliza una gran cantidad de tecnologías basadas en Javascript (Backbone, require, lo-dash...). También usamos otras tecnologías punteras como Dart o Docker."
        }
        ],
            
    };
  }

  void loadDataMining(Event e) {
    var basic = "Basic " + window.sessionStorage["token"];
    Map header = {'Authorization': basic};
    print("Cargando Data Mining");
    HttpRequest
        .request(globals.dataminingUrl, requestHeaders: header)
        .then((HttpRequest req) {

      //Map data = JSON.decode(req.response);

      print(req.response);
      printMessage(req.response);
    }).catchError((onError) {
      printMessage(onError.target.responseText);
    });
  }

}
