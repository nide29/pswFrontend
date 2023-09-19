import 'package:flutter/material.dart';

import '../model/objects/Ordine.dart';

class OrdineItem extends StatelessWidget{
  final Ordine? ordine;

  const OrdineItem({Key? key, this.ordine}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                  "id Ordine",
                  style: TextStyle(
                    color: Colors.black87, fontSize: 24, fontFamily: 'Avenir', fontWeight: FontWeight.bold),
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Text(ordine!.idOrdine.toString(),style: TextStyle(
                  color: Colors.black87, fontSize: 24, fontFamily: 'Avenir')),
            ],
          ),
          Column(
            children: [
              Text("Numero articoli",style: TextStyle(
                  color: Colors.black87, fontSize: 24, fontFamily: 'Avenir', fontWeight: FontWeight.bold),),
              Padding(padding: EdgeInsets.only(top: 10)),
              Text(ordine!.prodotti!.length.toString(),style: TextStyle(
                  color: Colors.black87, fontSize: 24, fontFamily: 'Avenir')),
            ],
          ),
          Column(
            children: [
              Text("Totale",style: TextStyle(
                  color: Colors.black87, fontSize: 24, fontFamily: 'Avenir', fontWeight: FontWeight.bold),),
              Padding(padding: EdgeInsets.only(top: 10)),
              Text('€${ordine!.importo.toString()}',style: TextStyle(
                  color: Colors.green, fontSize: 24, fontFamily: 'Avenir')),
            ],
          ),
        ],
      ),
    );
  }

}