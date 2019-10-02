import 'package:flutter/material.dart';
import 'package:flutter_new_articoli/Articoli.dart';
import 'package:flutter_new_articoli/category_list.dart';

class InsideCategory extends StatefulWidget {
  @override
  _InsideCategoryState createState() => _InsideCategoryState();
}

class _InsideCategoryState extends State<InsideCategory> {
  List<String> daStampare = [];

  @override
  Widget build(BuildContext context) {
    final list = ModalRoute.of(context).settings.arguments as Map<String, Object>;

    final String nome = list['nome'] as String;
    final Articoli art = list['art'] as Articoli;

    return Scaffold(
      appBar: AppBar(title: Text(nome.toUpperCase())),
      body: CategoryList( lista: _chooseList(nome, art))
    );
  }

  _chooseList(String nome, Articoli art) {

    if (nome.toLowerCase().compareTo("composizione")==0){
        daStampare = extractComposition(art.composition);
    } else if (nome.toLowerCase().compareTo("lotti")==0){
        daStampare=[];
        daStampare.add(art.lotto);
    } else if (nome.toLowerCase().compareTo("scadenze")==0){
        daStampare=[];
        daStampare.add(art.scadenza);
    } else {
        daStampare=[];
        daStampare.add("UM di magazzino: " +art.umMag);
        daStampare.add("UM di acquisto: " +art.umAcq);
    }
    return daStampare;

  }

  List<String> extractComposition(String composition) {
    List<String> ls = [];
    if (composition.compareTo("null")==0) {
      ls.add("Nessun ingrediente rilevato");
    } else {
      if (composition.contains("ingredienti:")) {
        List<String> s1 = composition.split(new RegExp(r"[(-)]"));
        List<String> s = s1.toString().split("ingredienti:\r\n\r\n");
        List<String> ingredienti = s[1].split(",");
        ls = ingredienti;
      } else {
        List<String> ingredienti = composition.split(",");
        ls = ingredienti;
      }

    }
    return ls;
  }

}


