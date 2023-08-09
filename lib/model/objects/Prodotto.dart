import 'package:flutter/material.dart';
import 'package:frontend/model/Model.dart';

class Prodotto {
  late int id;
  late int codice;
  late String nomeProdotto;
  late String descrizione;
  late String categoria;
  late String marca;
  late int prezzo;
  late int quantita;
  Image? icon;

  Prodotto(id, codice, nomeProdotto, descrizione, categoria, marca, prezzo,
      quantita) {
    this.id = id;
    this.codice = codice;
    this.nomeProdotto = nomeProdotto;
    this.descrizione = descrizione;
    this.categoria = categoria;
    this.marca = marca;
    this.prezzo = prezzo;
    this.quantita = quantita;

    Model.sharedInstance.getIcon(this.nomeProdotto).then((value) {
      icon = value;
    });
  } //constructor

  factory Prodotto.fromJson(Map<String, dynamic> json) {
    return Prodotto(
        json['id'],
        json['codice'],
        json['nomeProdotto'],
        json['descrizione'],
        json['categoria'],
        json['prezzo'],
        json['quantita'],
        json['marca']);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'nomeProdotto': nomeProdotto,
        'prezzo': prezzo,
        'categoria': categoria,
        'descrizione': descrizione,
        'quantita': quantita,
        'codice': codice,
        'marca': marca
      };

  @override
  String toString() {
    return nomeProdotto;
  }
}//Prodotto
