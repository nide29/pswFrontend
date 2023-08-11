import 'package:flutter/material.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';

import '../../widget/custom_appbar.dart';
import '../../widget/custom_navbar.dart';
import 'homepage.dart';
import 'loginPage.dart';

class AreaPersonalePage extends StatelessWidget {
  static const String routeName = '/areaPersonale';

  const AreaPersonalePage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => AreaPersonalePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.yellowAccent,
          title: const Text(
            'AREA PERSONALE',
            style: TextStyle(
                color: Colors.black87, fontSize: 24, fontFamily: 'Avenir'),
          ),
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.black87),
        ),
        body: Column(
          children: [
            const SizedBox(height: 70),

            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              //LOGIN
              SizedBox(
                height: 200,
                width: 200,
                child: FloatingActionButton(
                  heroTag: 'btn1',
                  foregroundColor: Colors.black87,
                  backgroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => Login())));
                  },
                  child: Stack(children: [
                    Align(
                      alignment: Alignment(-0.3, -0.3),
                      child: Icon(
                        Icons.login_rounded,
                        size: 125,
                        color: Colors.black.withOpacity(0.8),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0, 0.8),
                      child: Text(
                        'LOGIN', //categoria del prodotto
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.8),
                            fontSize: 20,
                            fontFamily: 'Avenir',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ]),
                ),
              ),

              // INFORMAZIONI UTENTE
              SizedBox(
                height: 200,
                width: 200,
                child: FloatingActionButton(
                  heroTag: 'btn2',
                  foregroundColor: Colors.black87,
                  backgroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  onPressed: () {},
                  child: Stack(children: [
                    Align(
                      alignment: Alignment(0, -0.3),
                      child: Icon(
                        Icons.info_outline_rounded,
                        size: 125,
                        color: Colors.black.withOpacity(0.8),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0, 0.8),
                      child: Text(
                        'INFORMAZIONI', //categoria del prodotto
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.8),
                            fontSize: 20,
                            fontFamily: 'Avenir',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ]),
                ),
              ),

              // ORDINI EFFETTUATI DALL' UTENTE
              SizedBox(
                height: 200,
                width: 200,
                child: FloatingActionButton(
                  heroTag: 'btn3',
                  foregroundColor: Colors.black87,
                  backgroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  onPressed: () {},
                  child: Stack(children: [
                    Align(
                      alignment: Alignment(0, -0.3),
                      child: Icon(
                        Icons.shopping_basket,
                        size: 125,
                        color: Colors.black.withOpacity(0.8),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0, 0.8),
                      child: Text(
                        'ORDINI', //categoria del prodotto
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.8),
                            fontSize: 20,
                            fontFamily: 'Avenir',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ]),
                ),
              ),
            ]),

            //LOGOUT
            Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                  child: TextButton(
                    onPressed: () {
                      //Model.sharedInstance.logOut();
                      //Utente.utente=null;
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: Row(
                                children: [
                                  const Text(
                                      "Log out effettuato!\nClicca su OK per essere reindirizzato alla Home"),
                                  MaterialButton(
                                    onPressed: () {
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomePage()),
                                        (Route<dynamic> route) => false,
                                      );
                                    },
                                    child: Text("OK"),
                                  ),
                                ],
                              ),
                            );
                          });
                    },
                    child: Text("Vuoi cambiare account? Effettua il LogOut"),
                  ),
                )),
          ],
        ));
  } //Build
}
