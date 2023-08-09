import 'package:flutter/material.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';
import 'package:frontend/model/Model.dart';

import '../model/objects/Prodotto.dart';

class GridView_prodotti extends StatelessWidget {
  const GridView_prodotti({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*List<String> list = [
      'images/image1.jpg',
      'images/image2.jpg',
      'images/image3.jpg',
      'images/image4.jpg',
      'images/image5.jpg',
      'images/image1.jpg',
      'images/image3.jpg',
      'images/image4.jpg',
      'images/image4.jpg',
      'images/image5.jpg',
      'images/image4.jpg',
      'images/image5.jpg',
      'images/image1.jpg',
      'images/image2.jpg',
      'images/image3.jpg',
      'images/image4.jpg',
      'images/image5.jpg',
      'images/image3.jpg',
      'images/image4.jpg',
      'images/image5.jpg',
      'images/image1.jpg',
      'images/image3.jpg',
      'images/image4.jpg',
      'images/image4.jpg',
      'images/image5.jpg',
      'images/image4.jpg',
      'images/image5.jpg',
      'images/image1.jpg',
      'images/image2.jpg',
      'images/image3.jpg',
      'images/image4.jpg',
      'images/image5.jpg',
      'images/image6.jpg'
    ];
*/

    List<Prodotto> list = List.empty(growable: true);

    Model.sharedInstance.getAllProdotti().then((value) {
      list.addAll(value);
    });
    print(list);

    return GridView.builder(
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
                alignment: Alignment(0, -0.8),
                child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: item
                        .icon /*Image.network(
                            item,
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                          )*/
                    ),
              ),
              const Align(
                alignment: Alignment(0, 0.5),
                child: Text(
                  'nome prodotto', //categoria del prodotto
                  style: TextStyle(
                      color: Colors.black87,
                      fontFamily: 'Avenir',
                      letterSpacing: 1.0),
                ),
              ),
              const Align(
                alignment: Alignment(0, 0.8),
                child: Text(
                  'prezzo prodotto', //categoria del prodotto
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 26,
                      fontFamily: 'Avenir',
                      fontWeight: FontWeight.bold),
                ),
              ),
            ]));
      },
      /*
      children: list
          .map(
            (item) => CustomCard(
                color: Colors.white,
                borderColor: Colors.grey.withOpacity(0.3),
                elevation: 12,
                onTap: () {
                  Navigator.pushNamed(context, '/prodotto');
                },
                borderRadius: 18,
                shadowColor: Colors.grey.withOpacity(0.12),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment(0, -0.8),
                      child: Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: item
                              .icon /*Image.network(
                            item,
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                          )*/
                          ),
                    ),
                    const Align(
                      alignment: Alignment(0, 0.5),
                      child: Text(
                        'nome prodotto', //categoria del prodotto
                        style: TextStyle(
                            color: Colors.black87,
                            fontFamily: 'Avenir',
                            letterSpacing: 1.0),
                      ),
                    ),
                    const Align(
                      alignment: Alignment(0, 0.8),
                      child: Text(
                        'prezzo prodotto', //categoria del prodotto
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 26,
                            fontFamily: 'Avenir',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )),
          )
          .toList(),*/
    );
  }
}
