import 'package:flutter/material.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';
import 'package:frontend/UI/pages.dart';
import 'package:frontend/UI/pages/loginPage.dart';
import 'package:intl/intl.dart';

import '../../model/Model.dart';
import '../../model/objects/Ordine.dart';
import '../../model/objects/Prodotto.dart';
import '../../model/objects/Prodotto_nel_Carrello.dart';
import '../../model/objects/Utente.dart';
import 'cart.dart';
import 'homepage.dart';

class ProductDetails extends StatefulWidget {
  final Prodotto prodotto;

  const ProductDetails({Key? key, required this.prodotto}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.yellowAccent,
          title: Text(
            'PRODOTTO: ${widget.prodotto.marca!.toUpperCase()} ${widget.prodotto.nome!.toUpperCase()}',
            style: const TextStyle(
                color: Colors.black87, fontSize: 24, fontFamily: 'Avenir'),
          ),
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.black87),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => Cart())));
                },
                icon: const Icon(Icons.shopping_cart))
          ]),
      body: ListView(
        children: [ Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 50, top: 70),
                  child: CustomCard(
                    height: 350,
                    width: 350,
                    color: Colors.white,
                    borderColor: Colors.grey.withOpacity(0.3),
                    elevation: 12,
                    borderRadius: 18,
                    shadowColor: Colors.grey.withOpacity(0.12),
                    child: Image.network(
                      'images/${widget.prodotto.nome!}.jpg',
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                ),
                Container(
                  width: 400,
                  child: Column(
                    // nome prodotto + disponibilità
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 100, top: 30),
                        child: Text(
                          '${widget.prodotto.marca!.toUpperCase()} ${widget.prodotto.nome!.toUpperCase()}',
                          style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 24,
                              fontFamily: 'Avenir',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 100, top: 120),
                        child: Text(
                          'Disponibilità:',
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 18,
                              fontFamily: 'Avenir',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 100, top: 10),
                        child: Text(
                          widget.prodotto.quantita! > 0
                              ? 'Disponibilità Immediata'
                              : 'Non Disponibile',
                          style: TextStyle(
                              color: widget.prodotto.quantita! > 0
                                  ? Colors.green
                                  : Colors.red,
                              fontSize: 17,
                              fontFamily: 'Avenir'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 100),
                        child: Text(
                          widget.prodotto.quantita! == 1
                              ? 'ULTIMO PRODOTTO RIMANENTE!'
                              : '',
                          style: const TextStyle(
                              color: Colors.redAccent,
                              fontSize: 12,
                              fontFamily: 'Avenir',
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 300, top: 30),
                      child: Text(
                        'Acquista a',
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 18,
                            fontFamily: 'Avenir',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 300, top: 10),
                      child: Text(
                        '€ ${widget.prodotto.prezzo!}.00',
                        style: const TextStyle(
                            color: Colors.green,
                            fontSize: 45,
                            fontFamily: 'Avenir',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 300, top: 50),
                      child: SizedBox(
                        height: 50,
                        width: 300,
                        child: FloatingActionButton(
                          onPressed: () {
                            if (widget.prodotto.quantita! > 0) {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    content: Text(
                                        "Prodotto aggiunto al carrello!\nClicca sullo schermo per tornare indietro"),
                                  );
                                });
                            ProdottoNelCarrello nuovo = ProdottoNelCarrello(
                                id: -1, quantita: 1, prodotto: widget.prodotto);
                            ProdottoNelCarrello.carrello!.add(nuovo);
                            } else {
                              //SE IL PRODOTTO NON é DISPOIBILE
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return const AlertDialog(
                                      content: Row(
                                        children: [
                                          Text(
                                              "Il prodotto non è momentaneamente disponibile!\nPremere sullo schermo per tornare indietro."),

                                        ],
                                      ),
                                    );
                                  });
                            }
                          },
                          heroTag: 'btnCart',
                          foregroundColor: Colors.black87,
                          backgroundColor: Colors.yellowAccent,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Row(children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 40),
                              child: Text(
                                'Aggiungi al carrello', //categoria del prodotto
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.8),
                                    fontSize: 20,
                                    fontFamily: 'Avenir',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Icon(
                              Icons.add_shopping_cart,
                              size: 30,
                              color: Colors.black.withOpacity(0.8),
                            ),
                          ]),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 300, top: 20),
                      child: SizedBox(
                        height: 40,
                        width: 300,
                        child: FloatingActionButton(
                          onPressed: () {
                            if (Utente.utente != null) {
                              if (widget.prodotto.quantita! > 0) {
                              List<ProdottoNelCarrello> ordineist = List<ProdottoNelCarrello>.empty(growable: true);
                              ordineist.add(ProdottoNelCarrello(
                                  id: -1,
                                  quantita: 1,
                                  prodotto: widget.prodotto));
                              print('COMPRA ORA: ' + ordineist.toString());
                              Model.sharedInstance
                                  .addOrdine(Ordine(
                                      idOrdine: -1,
                                      acquirente: Utente.utente,
                                      importo: widget.prodotto.prezzo,
                                  dataAcquisto: DateFormat('yyyy-MM-dd').format(DateTime.now()).toString(),
                                      prodotti: ordineist))
                                  .then((value) {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        content: Row(
                                          children: [
                                            const Text(
                                                "Ordine creato!\nClicca su OK per tornare alla home"),
                                            MaterialButton(
                                              onPressed: () {
                                                MaterialPageRoute route =
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            HomePage());
                                                Navigator.push(context, route);
                                              },
                                              child: const Text("OK"),
                                            ),
                                          ],
                                        ),
                                      );
                                    });
                              });
                              } else {
                                //SE LA QUANTITà DEL PRODOTTO è 0
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return const AlertDialog(
                                        content: Row(
                                          children: [
                                             Text(
                                                "Il prodotto non è momentaneamente disponibile!\nPremere sullo schermo per tornare indietro."),

                                          ],
                                        ),
                                      );
                                    });
                              }
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      content: Row(
                                        children: [
                                          const Text(
                                              'Per effettuare un ordine devi avere effettuato il LogIn!\nClicca su OK per farlo'),
                                          MaterialButton(
                                            onPressed: () {
                                              MaterialPageRoute route =
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                           Login(true));
                                              Navigator.push(context, route);
                                            },
                                            child: const Text("OK"),
                                          ),
                                        ],
                                      ),
                                    );
                                  });
                            }
                          },
                          heroTag: 'btnCheckout',
                          foregroundColor: Colors.black87,
                          backgroundColor: Colors.orangeAccent,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                          child: const Row(children: [
                            Padding(
                              padding: EdgeInsets.only(left: 70),
                              child: Text(
                                'Acquista ora', //categoria del prodotto
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'Avenir'),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Icon(
                                Icons.shopping_basket_outlined,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                          ]),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),

            //DETTAGLI PRODOTTO
            Padding(
              padding: EdgeInsets.only(top: 120, left: 60),
              child: Text(
                'Dettagli Prodotto: ',
                style: TextStyle(
                    color: Colors.black.withOpacity(0.8),
                    fontSize: 24,
                    fontFamily: 'Avenir',
                    fontWeight: FontWeight.bold),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 20, left: 60),
              child: Text(
                'NOME:  ${widget.prodotto.marca!} ${widget.prodotto.nome!}',
                style: TextStyle(
                    color: Colors.black.withOpacity(0.8),
                    fontSize: 18,
                    fontFamily: 'Avenir'),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 5, left: 60),
              child: Text(
                'CATEGORIA:  ${widget.prodotto.categoria!}',
                style: TextStyle(
                    color: Colors.black.withOpacity(0.8),
                    fontSize: 18,
                    fontFamily: 'Avenir'),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 5, left: 60),
              child: Text(
                'DESCRIZIONE:  ${widget.prodotto.descrizione!}',
                style: TextStyle(
                    color: Colors.black.withOpacity(0.8),
                    fontSize: 18,
                    fontFamily: 'Avenir'),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 5, left: 60),
              child: Text(
                "QUANTITA' DISPONIBILE:  ${widget.prodotto.quantita!}",
                style: TextStyle(
                    color: Colors.black.withOpacity(0.8),
                    fontSize: 18,
                    fontFamily: 'Avenir'),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 5, left: 60),
              child: Text(
                'PREZZO:  €${widget.prodotto.prezzo!}',
                style: TextStyle(
                    color: Colors.black.withOpacity(0.8),
                    fontSize: 18,
                    fontFamily: 'Avenir'),
              ),
            ),
          ],
        ),
      ]
      ),
    );
  }
}
