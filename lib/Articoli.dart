import 'package:flutter/material.dart';

class Articoli{
  String cod_art;
  String descr;
  //String um;
  String lotto;
  String scadenza;
  double quantity;
  String composition;
  String umMag;
  String umAcq;
  double import;

  Articoli({@required this.cod_art,
  @required this.descr,
  @required this.lotto,
  @required this.scadenza,
  @required this.quantity,
  @required this.composition,
  @required this.umMag,
  @required this.umAcq,
  @required this.import});

  double addQuantity(double q){
    quantity+=q;
  }

  double subQuantity(double q){
    quantity-=q;
  }

  factory Articoli.fromJson(Map<String, dynamic> json) {
    return new Articoli(
      cod_art: json['cod_art'] as String,
      descr: json['description'] as String,
      lotto: "0",
      scadenza: "30/12/1899",
      quantity: 0.0,
      composition: json['Composition'] as String,
      umMag: json['umMag'] as String,
      umAcq: json['umAcq'] as String,
      import: json['import'] as double
    );
  }

}