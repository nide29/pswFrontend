import 'package:flutter/material.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';

import '../../model/objects/Prodotto.dart';

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
                  Navigator.pushNamed(context, '/cart');
                },
                icon: const Icon(Icons.shopping_cart))
          ]),
      body: Column(
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
              Column(
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
                        onPressed: () {},
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
                        onPressed: () {},
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
              'NOME:  ${widget.prodotto.nome!}',
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
    );
  }
}
