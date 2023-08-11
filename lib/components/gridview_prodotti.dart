import 'package:flutter/material.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';
import 'package:frontend/model/Model.dart';

import '../model/objects/Prodotto.dart';

class GridView_prodotti extends StatelessWidget {
  const GridView_prodotti({
    Key? key,
  }) : super(key: key);

  static List<Prodotto> list = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {

    Model.sharedInstance.getAllProdotti().then((value) {
      if(list.isEmpty) {
        list.addAll(value);
      }
    });
    print('lista prodotti: '+ list.toString());
    print('famo na provetta');
    return Container(
      height: (list.length % 4) * 200,
      child: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        //crossAxisCount: 4,
        //crossAxisSpacing: 30,
        //mainAxisSpacing: 30,
        //padding: const EdgeInsets.only(left: 30, right: 30),
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          final item = list[index];
          return CustomCard(
              color: Colors.white,
              borderColor: Colors.grey.withOpacity(0.3),
              elevation: 12,
              onTap: () {
                Navigator.pushNamed(context, '/prodotto');
              },
              borderRadius: 18,
              shadowColor: Colors.grey.withOpacity(0.12),
              child: Stack(children: [
                Align(
                  alignment: const Alignment(0, -0.8),
                  child: Container(
                      height: 200,
                      width: 200,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Image.network(
                              'images/${item.nome!}.jpg',
                              fit: BoxFit.cover,
                              alignment: Alignment.topCenter,
                            )
                      ),
                ),
                Align(
                  alignment: const Alignment(0, 0.5),
                  child: Text(
                    '${item.marca!.toUpperCase()} ${item.nome!}', //categoria del prodotto
                    style: const TextStyle(
                        color: Colors.black87,
                        fontFamily: 'Avenir',
                        letterSpacing: 1.0),
                  ),
                ),
                Align(
                  alignment: const Alignment(0, 0.8),
                  child: Text(
                    '€ ${item.prezzo}', //categoria del prodotto
                    style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 26,
                        fontFamily: 'Avenir',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ]));
        },
      ),
    );
  }
}
