import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {

  List<String> lista;

  CategoryList({@required this.lista});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: lista.length,
      itemBuilder: (context, index) {
        return Card(
          child: Container(padding: EdgeInsets.all(10),
                      child: Text(lista[index], style: TextStyle(fontSize: 18))
        ),
        );
        
      },
    );


  }
}
