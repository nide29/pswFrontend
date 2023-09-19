import 'package:flutter/material.dart';
import 'package:frontend/model/objects/Utente.dart';

import '../../model/Model.dart';
import '../../model/objects/Ordine.dart';
import 'cart.dart';
import 'homepage.dart';
import 'infoUtente.dart';
import 'loginPage.dart';
import 'ordini.dart';

class AreaPersonalePage extends StatelessWidget {
  static const String routeName = '/areaPersonale';

  const AreaPersonalePage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => AreaPersonalePage(),
    );
  }

  static bool _status = false; //vale FALSE se non si è loggati, TRUE altrimenti
  static List<Ordine>? ordini = List.empty(growable: true);


  Future<void> fetchData() async {
    _status = Utente.utente == null ? false : true;
  }

  Future<void> fetchOrdini() async {
    if (_status) {
      Model.sharedInstance.getOrdineByUtente(Utente.utente!.email).then((
          value) {
        print('\nEMAIL UTENTE: ' + Utente.utente!.email);
        print('VALUE: ' +value.toString());
        if (value != null) {
          if(!(ordini!.contains(value))) {
            ordini = value;
          }
        print('ORDINI FETCHED: ' + ordini.toString());
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    fetchData();
    if(!_status) {
      ordini = List.empty(growable: true);
    }
    fetchOrdini();
    print('STATO LOGIN: ' + _status.toString());
    print("ORDINI1: " + ordini.toString());
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
          actions: [IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => Cart())));
              },
              icon: const Icon(Icons.shopping_cart))],
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) =>
                        const HomePage(),
                    transitionDuration: const Duration(seconds: 0),
                    reverseTransitionDuration: const Duration(seconds: 0),
                  ),
                  (Route<dynamic> route) => false);
            },
          ),
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
                    if (!_status) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) => Login(false))));
                    } else {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: Row(
                                children: [
                                  Text(
                                      '${Utente.utente!.nome.toUpperCase()}, hai già effettuato il LogIn!'),
                                  MaterialButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("OK"),
                                  ),
                                ],
                              ),
                            );
                          });
                    }
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
                  onPressed: () {
                    if (!_status) {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: Row(
                                children: [
                                  Text(
                                      'Per visualizzare le tue informazioni personali devi prima effettuare il LogIn!'),
                                  MaterialButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("OK"),
                                  ),
                                ],
                              ),
                            );
                          });
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InformazioniUtente()));
                    }
                  },
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
                  onPressed: () {
                    if (!_status) {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: Row(
                                children: [
                                  const Text(
                                      'Per visualizzare i tuoi ordini devi prima effettuare il LogIn!'),
                                  MaterialButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("OK"),
                                  ),
                                ],
                              ),
                            );
                          });
                    } else {
                      print('ORDINI: ' + ordini.toString());
                      fetchOrdini();
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Orders(ordini!)));
                    }
                  },
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
                      Model.sharedInstance.logOut();
                      Utente.utente = null;
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
                                          PageRouteBuilder(
                                            pageBuilder: (context, animation1,
                                                    animation2) =>
                                                const HomePage(),
                                            transitionDuration:
                                                const Duration(seconds: 0),
                                            reverseTransitionDuration:
                                                const Duration(seconds: 0),
                                          ),
                                          (Route<dynamic> route) => false);
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
