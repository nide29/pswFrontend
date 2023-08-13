import 'package:flutter/material.dart';

class Utente {
  int id;
  String nome;
  String cognome;
  //String telefono;
  String email;
  String password;
  //String indirizzo;

  static Utente? utente;

  Utente({
    required this.id,
    required this.nome,
    required this.cognome,
    //required this.telefono,
    required this.email,
    required this.password,
    //required this.indirizzo
  });

  factory Utente.fromJson(Map<String, dynamic> json) {
    return Utente(
      id: json['id'],
      password: json['password'],
      nome: json['nome'],
      cognome: json['cognome'],
      //telefono: json['telefono'],
      email: json['email'],
      //indirizzo: json['indirizzo'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'password': password,
        'nome': nome,
        'cognome': cognome,
        //'telefono': telefono,
        'email': email,
        //'indirizzo': indirizzo,
      };

  @override
  String toString() {
    return nome + " " + cognome;
  }
}
