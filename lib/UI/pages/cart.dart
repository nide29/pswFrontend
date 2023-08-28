import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../components/cart_products.dart';
import '../../model/Model.dart';
import '../../model/objects/Ordine.dart';
import '../../model/objects/Prodotto_nel_Carrello.dart';
import '../../model/objects/Utente.dart';
import 'areaPersonale.dart';
import 'homepage.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  double? totale;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.yellowAccent,
          title: const Text(
            'CARRELLO',
            style: TextStyle(
                color: Colors.black87, fontSize: 24, fontFamily: 'Avenir'),
          ),
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.black87),
          ),

      body: Cart_products(),
      bottomNavigationBar: Container(
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Expanded(
                  child: ListTile(
                title: const Text("Totale:"),
                subtitle: Text('€${calcolaTotale()}'),
              )),
              Expanded(
                  child: MaterialButton(
                      onPressed: () {
                        if (Utente.utente == null) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: Row(
                                    children: [
                                      const Text(
                                          "Per effettuare un ordine devi avere effettuato il LogIn!\nClicca su OK per farlo"),
                                      MaterialButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      AreaPersonalePage()));
                                        },
                                        child: Text("OK"),
                                      ),
                                    ],
                                  ),
                                );
                              });
                        } else {
                          Model.sharedInstance
                              .addOrdine(Ordine(
                            idOrdine: -1,
                            acquirente: Utente.utente!,
                            importo: calcolaTotale(),
                            //dataAcquisto: DateTime.now().toString(),
                            dataAcquisto: DateFormat('yyyy-MM-dd').format(DateTime.now()).toString(),
                            prodotti: ProdottoNelCarrello.carrello!,
                          ))
                              .then((value) {
                            ProdottoNelCarrello.carrello = List<ProdottoNelCarrello>.empty(growable: true);
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    content: Row(
                                      children: [
                                        const Text(
                                            "Ordine effettuato !\nClicca su OK per tornare alla home"),
                                        MaterialButton(
                                            child: const Text("OK"),
                                            onPressed: () {
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
                                            }),
                                      ],
                                    ),
                                  );
                                });
                          });
                        }
                      },
                      height: 40,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                      color: Colors.orange,
                      child: const Text("Conferma ordine",
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'Avenir'))))
            ],
          )),
    );
  }

  double calcolaTotale() {
    double totale = 0;
    for (ProdottoNelCarrello p in ProdottoNelCarrello.carrello!) {
      totale += p.prodotto!.prezzo!;
    }
    return totale;
  }
}
