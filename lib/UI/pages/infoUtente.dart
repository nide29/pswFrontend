import 'package:flutter/material.dart';

import '../../model/Model.dart';
import '../../model/objects/Utente.dart';
import 'homepage.dart';

class InformazioniUtente extends StatefulWidget {
  @override
  _InformazioniUtenteState createState() => _InformazioniUtenteState();
}

class _InformazioniUtenteState extends State<InformazioniUtente> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.yellowAccent,
        title: const Text(
          'INFORMAZIONI PERSONALI',
          style: TextStyle(
              color: Colors.black87, fontSize: 24, fontFamily: 'Avenir'),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: ListView(
        children:[ Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.account_box,
                color: Colors.black87,
                size: 300,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text(
                  'ID: ${Utente.utente!.id}',
                  style: const TextStyle(
                      color: Colors.black87, fontSize: 34, fontFamily: 'Avenir'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  'Nome: ${Utente.utente!.nome.toUpperCase()}',
                  style: const TextStyle(
                      color: Colors.black87, fontSize: 34, fontFamily: 'Avenir'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  'Cognome: ${Utente.utente!.cognome.toUpperCase()}',
                  style: const TextStyle(
                      color: Colors.black87, fontSize: 34, fontFamily: 'Avenir'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  'Email: ${Utente.utente!.email.toLowerCase()}',
                  style: const TextStyle(
                      color: Colors.black87, fontSize: 34, fontFamily: 'Avenir'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _isObscured
                          ? 'Password: '
                          : 'Password: ${Utente.utente!.password}',
                      style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 34,
                          fontFamily: 'Avenir'),
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            _isObscured = !_isObscured;
                          });
                        },
                        icon: Icon(
                          _isObscured ? Icons.visibility : Icons.visibility_off,
                        ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  'Indirizzo: ${Utente.utente!.indirizzo.toLowerCase()}',
                  style: const TextStyle(
                      color: Colors.black87, fontSize: 34, fontFamily: 'Avenir'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  'Telefono: ${Utente.utente!.telefono.toLowerCase()}',
                  style: const TextStyle(
                      color: Colors.black87, fontSize: 34, fontFamily: 'Avenir'),
                ),
              ),

              //ELIMINA ACCOUNT
              Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Container(
                    child: TextButton(
                      onPressed: () {
                        Model.sharedInstance.deleteUser(Utente.utente!.id.toString());
                        Utente.utente = null;
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Row(
                                  children: [
                                    const Text(
                                        "Account eliminato!\nClicca su OK per essere reindirizzato alla Home"),
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
                                      child: const Text("OK"),
                                    ),
                                  ],
                                ),
                              );
                            });
                      },
                      child: const Text("Clicca qui per eliminare il tuo account. L'operazione è irreversible", style: TextStyle(color: Colors.red),),
                    ),
                  )),
            ],
          ),
        ),
    ]
      ),
    );
  }
}
