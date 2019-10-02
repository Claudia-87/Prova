import 'package:flutter/material.dart';
import 'package:flutter_new_articoli/CategoryItem.dart';
import './Articoli.dart';
import './ListaCategorie.dart';

class ArticoloScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final art = ModalRoute.of(context).settings.arguments as Map<String, Articoli>;


    return Scaffold(

        appBar: AppBar(title: Text(art['art'].descr.toUpperCase()),),
        body: GridView(
          padding: EdgeInsets.all(15),
          children: ListaCategorie.map((listCat) => CategoryItem(nome: listCat.nome,
                                                      color: listCat.color,
                                                      cod_art: art['art'].cod_art,
                                                      art:art['art'])
          ).toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200,
                      childAspectRatio: 3/2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20)
        )
    );
  }
}
