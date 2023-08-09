import 'package:frontend/model/objects/Prodotto.dart';

class ProdottoNelCarrello {
  int id;
  int quantita;
  Prodotto prodotto;

  static List<ProdottoNelCarrello> carrello = List.empty(growable: true);

  ProdottoNelCarrello(
      {required this.id, required this.quantita, required this.prodotto});

  factory ProdottoNelCarrello.fromJson(Map<String, dynamic> json) {
    return ProdottoNelCarrello(
      id: json['id'],
      quantita: json['quantita'],
      prodotto: Prodotto.fromJson(json['prodotto']),
    );
  }
  Map<String, dynamic> toJson() => {
        'id': -1,
        'quantita': quantita,
        'prodotto': prodotto.toJson(),
      };

  int? setQuantita(int nuovaQuantita) {
    this.quantita = nuovaQuantita;
  }
}
