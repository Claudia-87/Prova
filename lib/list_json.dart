import 'package:flutter/material.dart';
import './Articoli.dart';
import './NuovaPagina.dart';

class ArticleList extends StatefulWidget {
  List<Articoli> articoli;

  ArticleList(this.articoli);

  @override
  _ArticleListState createState() => _ArticleListState();
}

class _ArticleListState extends State<ArticleList> {
  double quant;

  int position;

  final qController = new TextEditingController();

  void _AggiungiRimuoviQuantita(BuildContext ctx, int pos) {
    position = pos;
    showModalBottomSheet(context: ctx, builder: (_) {
      return new GestureDetector(
        child: NuovaPagina(quantController: qController, handlerAggiungi: aggiungiQ, handlerRimuovi: rimuoviQ,),
        behavior: HitTestBehavior.opaque,
      );
    });
  }

  void aggiungiQ(){
    setState(() {
      widget.articoli[position].addQuantity(double.parse(qController.text));
      qController.clear();
      Navigator.of(context).pop();
    });
  }

  void rimuoviQ(){
    setState(() {
      if (widget.articoli[position].quantity>=double.parse(qController.text))
        widget.articoli[position].subQuantity(double.parse(qController.text));
      qController.clear();
      Navigator.of(context).pop();
    });
  }

  _onTap(Articoli articolo){
    Navigator.of(context).pushNamed('/articoli', arguments: {'art': articolo});
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child:
    Column(children: <Widget>[
      Column(children: widget.articoli.map((art) {
        return
          new GestureDetector(
              onTap: () => _onTap(art),
              child:
              Card(elevation: 5,
                  child:
                  Column(crossAxisAlignment: CrossAxisAlignment.center,
                    children: [Text("${art.descr.toUpperCase()} (${art.umMag})",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("cod. art. ${art.cod_art}",
                                      style: TextStyle(color: Colors.blueGrey)),
                                  Text("lotto: ${art.lotto} scadenza: ${art
                                      .scadenza}",
                                      style: TextStyle(color: Colors.blueGrey)),
                                ]),
                            Container(margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                              decoration: BoxDecoration(border: Border.all(
                                  color: Colors.cyan, width: 1),
                                  color: Colors.cyan),
                              //  padding: EdgeInsets.all(0.1),
                              child: ButtonTheme(minWidth: 10,
                                  height: 5,
                                  child: FlatButton(
                                      child: Text(art.quantity.toString()),
                                      onPressed: () =>
                                          _AggiungiRimuoviQuantita(context, widget.articoli.indexOf(art)))
                              ),
                            )
                          ]
                      ),
                    ],)
              )
          );
      }).toList(),
      )
    ])
    );
  }
}
