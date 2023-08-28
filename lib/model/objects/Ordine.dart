import 'package:frontend/model/objects/Prodotto_nel_Carrello.dart';
import 'package:frontend/model/objects/Utente.dart';

class Ordine {
  int? idOrdine;
  double? importo;
  String? dataAcquisto;
  //DateTime? dataAcquisto;
  Utente? acquirente;
  List<ProdottoNelCarrello>? prodotti;

  Ordine(
      {this.idOrdine,
      this.importo,
      this.dataAcquisto,
      this.acquirente,
      this.prodotti});

  factory Ordine.fromJson(Map<String, dynamic> json) {
    return Ordine(
      idOrdine: json['id'],
      importo: json['importo'],
      dataAcquisto: DateTime.fromMillisecondsSinceEpoch(json['dataAcquisto']).toString(),
      acquirente: Utente.fromJson(json['acquirente']),
      prodotti: List<ProdottoNelCarrello>.from((json['prodotti'])
          .map((i) => ProdottoNelCarrello.fromJson(i))
          .toList()),
    );
  }

  Map<String, dynamic> toJson() => {
        'idOrdine': -1,
        'importo': importo,
        'dataAcquisto': dataAcquisto,
        'acquirente': acquirente!.toJson(),
        'prodotti': prodotti,
      };
}
