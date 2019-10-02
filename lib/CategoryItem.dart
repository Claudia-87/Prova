import 'package:flutter/material.dart';
import './Articoli.dart';

class CategoryItem extends StatelessWidget {
  String nome;
  Color color;
  String cod_art;
  Articoli art;

  CategoryItem({this.nome, this.color, @required this.cod_art, @required this.art});

  _onTap(BuildContext context){
    Navigator.of(context).pushNamed('/categoria', arguments: {'nome':nome, 'art': art});
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
        onTap: () => _onTap(context),
        child: Container(padding: const EdgeInsets.all(15),
                     child: Text(nome),
                     decoration: BoxDecoration(gradient: LinearGradient(
                                              colors: [color.withOpacity(0.7), color],
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                     ),
    )
    );
  }
}
