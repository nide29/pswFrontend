import 'package:flutter/material.dart';
import 'package:frontend/model/Model.dart';

class Prodotto {
  int? id;
  String? nome;
  String? descrizione;
  String? marca;
  String? categoria;
  double? prezzo;
  int? quantita;
  Image? icon;

  Prodotto(id, nome, descrizione, marca, categoria, prezzo, quantita) {
    this.id = id;
    this.nome = nome;
    this.descrizione = descrizione;
    this.marca = marca;
    this.categoria = categoria;
    this.prezzo = prezzo;
    this.quantita = quantita;


  } //constructor

  factory Prodotto.fromJson(Map<String, dynamic> json) {
    return Prodotto(
        json['id'],
        json['nome'],
        json['descrizione'],
        json['marca'],
        json['categoria'],
        json['prezzo'],
        json['quantita']);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'nome': nome,
        'descrizione': descrizione,
        'marca': marca,
        'categoria': categoria,
        'prezzo': prezzo,
        'quantita': quantita
      };

  @override
  String toString() {
    return nome!;
  }
} //Prodotto
