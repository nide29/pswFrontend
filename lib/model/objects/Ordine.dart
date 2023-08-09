import 'package:frontend/model/objects/Prodotto_nel_Carrello.dart';
import 'package:frontend/model/objects/Utente.dart';

class Ordine {
  int idOrdine;
  Utente acquirente;
  double importo;
  String dataAcquisto;
  List<ProdottoNelCarrello> prodotti;

  Ordine(
      {required this.idOrdine,
      required this.acquirente,
      required this.importo,
      required this.dataAcquisto,
      required this.prodotti});

  factory Ordine.fromJson(Map<String, dynamic> json) {
    return Ordine(
      idOrdine: json['idOrdine'],
      acquirente: Utente.fromJson(json['acquirente']),
      importo: json['importo'],
      dataAcquisto: json['dataAcquisto'],
      prodotti: List<ProdottoNelCarrello>.from((json['prodotti'])
          .map((i) => ProdottoNelCarrello.fromJson(i))
          .toList()),
    );
  }

  Map<String, dynamic> toJson() => {
        'idOrdine': -1,
        'acquirente': acquirente.toJson(),
        'importo': importo,
        'dataAcquisto': dataAcquisto,
        'prodotti': prodotti,
      };
}
