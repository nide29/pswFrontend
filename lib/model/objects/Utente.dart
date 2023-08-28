import 'package:flutter/material.dart';

class Utente {
  int id;
  String nome;
  String cognome;
  String telefono;
  String email;
  String password;
  String indirizzo;

  static Utente? utente;

  Utente(
      {required this.id,
      required this.nome,
      required this.cognome,
      required this.telefono,
      required this.email,
      required this.password,
      required this.indirizzo});

  factory Utente.fromJson(Map<String, dynamic> json) {
    return Utente(
        id: json['id'],
        nome: json['nome'],
        cognome: json['cognome'],
        email: json['email'],
        password: json['password'],
        indirizzo: json['indirizzo'],
        telefono: json['telefono']
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'nome': nome,
        'cognome': cognome,
        'email': email,
        'password': password,
        'indirizzo': indirizzo,
        'telefono': telefono
      };

  @override
  String toString() {
    return nome + " " + cognome;
  }
}
