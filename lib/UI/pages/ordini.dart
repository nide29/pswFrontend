import 'package:flutter/material.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';

import '../../model/objects/Ordine.dart';
import '../../widget/OrdineItem.dart';

class Orders extends StatefulWidget {
  List<Ordine> list;

  Orders(this.list);

  @override
  _OrdersState createState() => _OrdersState(list);
}

class _OrdersState extends State<Orders> {
  final List<Ordine> list;

  _OrdersState(this.list);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.yellowAccent,
        title: const Text(
          'ORDINI',
          style: TextStyle(
              color: Colors.black87, fontSize: 24, fontFamily: 'Avenir'),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: ListView.separated(
        itemCount: list.length,
        itemBuilder: (context, index) => (GestureDetector(
          child: CustomCard(
              onTap: () {
                Navigator.of(context).push(PageRouteBuilder(
                    pageBuilder: (BuildContext context, _, __) =>
                        DettaglioOrdine(
                          ordine: list.elementAt(index),
                        )));
              },
              borderRadius: 18,
              borderColor: Colors.grey.withOpacity(0.13),
              child: OrdineItem(ordine: list.elementAt(index))),
        )),
        separatorBuilder: (BuildContext context, int index) => Divider(
          color: Theme.of(context).primaryColor,
          height: 5,
        ),
      ),
      bottomNavigationBar: Container(
          color: Colors.white,
          child: const Row(
            children: <Widget>[],
          )),
    );
  }
}

class DettaglioOrdine extends StatelessWidget {
  final Ordine? ordine;

  const DettaglioOrdine({Key? key, this.ordine}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.yellowAccent,
        title: const Text(
          'ORDINI',
          style: TextStyle(
              color: Colors.black87, fontSize: 24, fontFamily: 'Avenir'),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: body(),
    );
  }

  Widget body() {
    return Container(
        padding: const EdgeInsets.only(top: 40, right: 40, left: 10),
        child: ListView.separated(
          itemCount: ordine!.prodotti!.length,
          itemBuilder: (context, index) => (Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 70,
                height: 70,
                child: Image.network(
                    'images/${ordine!.prodotti!.elementAt(index).prodotto!.nome}.jpg'),
              ),
              Column(
                children: [
                  Container(
                    width: 200,
                    child: const Text(
                      "Nome Prodotto",
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                          fontFamily: 'Avenir',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 10)),
                  Container(
                    width: 200,
                    child: Text(
                      '${ordine!.prodotti!.elementAt(index).prodotto!.marca!.toUpperCase()} ${ordine!.prodotti!.elementAt(index).prodotto!.nome!.toUpperCase()}',
                      style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                          fontFamily: 'Avenir'),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    width: 200,
                    child: const Text(
                      "Quantità acquistata",
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                          fontFamily: 'Avenir',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 10)),
                  Container(
                    width: 200,
                    child: Text(
                      ordine!.prodotti!.elementAt(index).quantita.toString(),
                      style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                          fontFamily: 'Avenir'),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    width: 200,
                    child: const Text(
                      "Data Acquisto",
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                          fontFamily: 'Avenir',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 10)),
                  Container(
                    width: 200,
                    child: Text(
                      '${ordine!.dataAcquisto}'.substring(0,10),
                      style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                          fontFamily: 'Avenir'),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    width: 200,
                    child: const Text(
                      "Totale",
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                          fontFamily: 'Avenir',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 10)),
                  Container(
                    width: 200,
                    child: Text(
                      '€ ${ordine!.prodotti!.elementAt(index).prodotto!.prezzo.toString()}',
                      style: const TextStyle(
                          color: Colors.green,
                          fontSize: 16,
                          fontFamily: 'Avenir'),
                    ),
                  )
                ],
              ),
            ],
          )),
          separatorBuilder: (BuildContext context, int index) => Divider(
            color: Theme.of(context).primaryColor,
            height: 5,
          ),
        ));
  }
}
