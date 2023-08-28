import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';
import 'package:frontend/main.dart';

import '../UI/pages/Categoria.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 260.0,
        child: GridView.count(
          crossAxisCount: 5,
          crossAxisSpacing: 30,
          mainAxisSpacing: 30,
          padding: const EdgeInsets.only(left: 30, right: 30),
          children: [
            //REFLEX
            CustomCard(
              color: Colors.white,
              elevation: 12,
              height: 260,
              width: 260,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => Categoria('reflex'))));
              },
              borderRadius: 18,
              shadowColor: Colors.grey.withOpacity(0.12),
              child: Stack(alignment: Alignment.bottomCenter, children: [
                ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                    child:
                        Image.network('images/reflex.jpg', fit: BoxFit.cover)),
                const Text(
                  'REFLEX', //categoria del prodotto
                  style: TextStyle(
                      color: Colors.black87,
                      fontFamily: 'Avenir',
                      letterSpacing: 5.0),
                ),
              ]),
            ),

            //MIRRORLESS
            CustomCard(
              color: Colors.white,
              elevation: 12,
              height: 260,
              width: 260,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => Categoria('mirrorless'))));
              },
              borderRadius: 18,
              shadowColor: Colors.grey.withOpacity(0.12),
              child: Stack(alignment: Alignment.bottomCenter, children: [
                ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                    child:
                        Image.network('images/reflex.jpg', fit: BoxFit.cover)),
                const Text(
                  'MIRRORLESS', //categoria del prodotto
                  style: TextStyle(
                      color: Colors.black87,
                      fontFamily: 'Avenir',
                      letterSpacing: 5.0),
                ),
              ]),
            ),

            //OBIETTIVI
            CustomCard(
              color: Colors.white,
              elevation: 12,
              height: 260,
              width: 260,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => Categoria('obiettivi'))));
              },
              borderRadius: 18,
              shadowColor: Colors.grey.withOpacity(0.12),
              child: Stack(alignment: Alignment.bottomCenter, children: [
                ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                    child:
                        Center(child: Image.network('images/obiettivi.jpg', fit: BoxFit.cover, scale: 1.8))),
                const Text(
                  'OBIETTIVI', //categoria del prodotto
                  style: TextStyle(
                      color: Colors.black87,
                      fontFamily: 'Avenir',
                      letterSpacing: 5.0),
                ),
              ]),
            ),

            //BATTERIE
            CustomCard(
              color: Colors.white,
              elevation: 12,
              height: 260,
              width: 260,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => Categoria('batterie'))));
              },
              borderRadius: 18,
              shadowColor: Colors.grey.withOpacity(0.12),
              child: Stack(alignment: Alignment.bottomCenter, children: [
                ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                    child:
                        Center(child: Image.network('images/batterie.jpg', fit: BoxFit.cover, scale:1.7,))),
                const Text(
                  'BATTERIE', //categoria del prodotto
                  style: TextStyle(
                      color: Colors.black87,
                      fontFamily: 'Avenir',
                      letterSpacing: 5.0),
                ),
              ]),
            ),

            //ACCESSORI
            CustomCard(
              color: Colors.white,
              elevation: 12,
              height: 260,
              width: 260,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => Categoria('accessori'))));
              },
              borderRadius: 18,
              shadowColor: Colors.grey.withOpacity(0.12),
              child: Stack(alignment: Alignment.bottomCenter, children: [
                ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                    child:
                        Image.network('images/accessori.jpg', fit: BoxFit.cover)),
                const Text(
                  'ACCESSORI', //categoria del prodotto
                  style: TextStyle(
                      color: Colors.black87,
                      fontFamily: 'Avenir',
                      letterSpacing: 5.0),
                ),
              ]),
            ),
          ],
        ));
  } //build
}


/* //ALTERNATIVA PRECEDENTE
class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 220.0,
        child: Row(
          //scrollDirection: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //REFLEX
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/reflex');
              },
              child: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.12),
                    spreadRadius: 2,
                    blurRadius: 20,
                    //offset: Offset(5, 5)
                  )
                ]),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Image.network('images/reflex.jpg', fit: BoxFit.cover),
                        const Text(
                          'REFLEX', //categoria del prodotto
                          style: TextStyle(
                              color: Colors.black87,
                              fontFamily: 'Avenir',
                              letterSpacing: 5.0),
                        ),
                      ],
                    )),
              ),
            ),

            //MIRRORLESS
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/mirrorless');
              },
              child: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.12),
                    spreadRadius: 2,
                    blurRadius: 20,
                    //offset: Offset(5, 5)
                  )
                ]),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Image.network('images/reflex.jpg', fit: BoxFit.cover),
                        const Text(
                          'MIRRORLESS', //categoria del prodotto
                          style: TextStyle(
                              color: Colors.black87,
                              fontFamily: 'Avenir',
                              letterSpacing: 5.0),
                        ),
                      ],
                    )),
              ),
            ),

            //OBIETTIVI
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/obiettivi');
              },
              child: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.12),
                    spreadRadius: 2,
                    blurRadius: 20,
                    //offset: Offset(5, 5)
                  )
                ]),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Image.network('images/reflex.jpg', fit: BoxFit.cover),
                        const Text(
                          'OBIETTIVI', //categoria del prodotto
                          style: TextStyle(
                              color: Colors.black87,
                              fontFamily: 'Avenir',
                              letterSpacing: 5.0),
                        ),
                      ],
                    )),
              ),
            ),

            //BATTERIE
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/batterie');
              },
              child: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.12),
                    spreadRadius: 2,
                    blurRadius: 20,
                    //offset: Offset(5, 5)
                  )
                ]),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Image.network('images/reflex.jpg', fit: BoxFit.cover),
                        const Text(
                          'BATTERIE', //categoria del prodotto
                          style: TextStyle(
                              color: Colors.black87,
                              fontFamily: 'Avenir',
                              letterSpacing: 5.0),
                        ),
                      ],
                    )),
              ),
            ),

            //ACCESSORI
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/accessori');
              },
              child: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.12),
                    spreadRadius: 2,
                    blurRadius: 20,
                    //offset: Offset(5, 5)
                  )
                ]),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Image.network('images/reflex.jpg', fit: BoxFit.cover),
                        const Text(
                          'ACCESSORI', //categoria del prodotto
                          style: TextStyle(
                              color: Colors.black87,
                              fontFamily: 'Avenir',
                              letterSpacing: 5.0),
                        ),
                      ],
                    )),
              ),
            ),
          ],
        ));
  } //build
}*/
