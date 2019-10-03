import 'package:flutter/material.dart';
import 'package:flutter_new_articoli/articolo_screen.dart';
import 'package:flutter_new_articoli/inside_category.dart';
import 'package:flutter_new_articoli/list_json.dart';
import './Articoli.dart';
import 'dart:convert';
import './articolo_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Articoli nuovo',
      home: MyHomePage(),
      routes: {
        '/articoli': (ctx) => ArticoloScreen(),
        '/categoria': (ctx) => InsideCategory(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  List<Articoli> parseJson(String response) {
    if(response==null){
      return [];
    }
    final parsed = json.decode(response.toString()).cast<Map<String, dynamic>>();
    return parsed.map<Articoli>((json) => new Articoli.fromJson(json)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Lista di articoli'),),
        body: new FutureBuilder(
          future: DefaultAssetBundle.of(context).loadString('assets/barcode.json'),
          builder: (context, snapshot) {
            if (snapshot.hasData){
              List<Articoli> articoli = parseJson(snapshot.data.toString());
              return articoli.isNotEmpty ? new ArticleList(articoli) : new CircularProgressIndicator();
            } else
              return new Container();
            }
    )
    );
  }
}
