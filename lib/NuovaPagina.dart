import 'package:flutter/material.dart';

class NuovaPagina extends StatefulWidget {
  final quantController;
  final Function handlerAggiungi;
  final Function handlerRimuovi;

  NuovaPagina({@required this.quantController, @required this.handlerAggiungi, @required this.handlerRimuovi});

  @override
  _NuovaPaginaState createState() => _NuovaPaginaState();
}

class _NuovaPaginaState extends State<NuovaPagina> {

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          TextField(decoration: InputDecoration(labelText: 'Inserisci quantità'),
            controller: widget.quantController,
            keyboardType: TextInputType.number,
            autofocus: true,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: FlatButton(
                  child: Text('Rimuovi quantità', style: TextStyle(color: Colors.purple),),
                  onPressed: widget.handlerRimuovi,),
              ),
              Container(
                  child: FlatButton(
                    child: Text('Aggiungi quantità', style: TextStyle(color: Colors.purple)),
                    onPressed: widget.handlerAggiungi,)
              )
            ],
          ),
        ],
      ),
    );
  }
}
