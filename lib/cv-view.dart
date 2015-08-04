@HtmlImport('src/cv-view.html')
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
    return {"hello" : "viene de dart"};
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
