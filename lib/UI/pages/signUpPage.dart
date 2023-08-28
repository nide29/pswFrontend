import 'package:flutter/material.dart';
import 'package:frontend/model/objects/Utente.dart';

import '../../model/Model.dart';
import 'homepage.dart';
import 'loginPage.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _lastnameTextController = TextEditingController();
  TextEditingController _phoneTextController = TextEditingController();
  TextEditingController addressTextController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 3;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.white,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
              alignment: Alignment.topCenter,
              child: Image.network('images/reflex.jpg')),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 300.0),
              child: Center(
                child: Form(
                    child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white.withOpacity(0.4),
                        elevation: 0.0,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: TextFormField(
                            controller: _nameTextController,
                            decoration: InputDecoration(
                              hintText: "Nome: ",
                              icon: Icon(Icons.person),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Il campo nome non può essere vuoto ";
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white.withOpacity(0.4),
                        elevation: 0.0,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: TextFormField(
                            controller: _lastnameTextController,
                            decoration: InputDecoration(
                              hintText: "Cognome: ",
                              icon: Icon(Icons.person_outline),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Il campo conome non può essere vuoto ";
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white.withOpacity(0.4),
                        elevation: 0.0,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: TextFormField(
                            controller: _phoneTextController,
                            decoration: InputDecoration(
                              hintText: "Telefono: ",
                              icon: Icon(Icons.phone_android),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Il campo telefono non può essere vuoto ";
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white.withOpacity(0.4),
                        elevation: 0.0,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: TextFormField(
                            controller: addressTextController,
                            decoration: InputDecoration(
                              hintText: "Indirizzo: ",
                              icon: Icon(Icons.house_outlined),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Il campo indirizzo non può essere vuoto ";
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white.withOpacity(0.4),
                        elevation: 0.0,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: TextFormField(
                            controller: _emailTextController,
                            decoration: InputDecoration(
                              hintText: "Email",
                              icon: Icon(Icons.alternate_email),
                            ),
                            /* validator: (value) {
                                  if (value!.isEmpty) {
                                    Pattern pattern =
                                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                    RegExp regex = RegExp(pattern.toString());
                                    if (!regex.hasMatch(value))
                                      return 'verifica la tua email ';
                                    else
                                      return null;
                                  }
                                },*/
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white.withOpacity(0.4),
                        elevation: 0.0,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: TextFormField(
                            controller: _passwordTextController,
                            decoration: InputDecoration(
                              hintText: "Password",
                              icon: Icon(Icons.lock_outline),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Il campo password non può essere vuoto ";
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white.withOpacity(0.4),
                        elevation: 0.0,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: TextFormField(
                            controller: _confirmPasswordController,
                            decoration: InputDecoration(
                              hintText: "Conferma password",
                              icon: Icon(Icons.lock_outline),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Il campo password non può essere vuoto ";
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                      child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.yellowAccent,
                          elevation: 5.0,
                          shadowColor: Colors.black.withOpacity(0.2),
                          child: MaterialButton(
                            onPressed: () {

                                  Utente nuovo =  Utente(id: -1 ,
                                  nome:_nameTextController.text,
                                  cognome: _lastnameTextController.text,
                                  telefono: _phoneTextController.text,
                                  indirizzo: addressTextController.text,
                                  email: _emailTextController.text,
                                  password: _passwordTextController.text);
                                  Model.sharedInstance.addUser(nuovo);

                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));

                            },
                            minWidth: MediaQuery.of(context).size.width,
                            child: Text(
                              "Registrati",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.87),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0),
                            ),
                          )),
                    ),

                    //Scritta per tornare al menu principale in caso di dubbi durante la fase di registrazione
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(12),
                            child: SizedBox(
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()),
                                    (Route<dynamic> route) => false,
                                  );
                                },
                                child: Text("Torna al Menu Principale"),
                              ),
                            )),
                      ],
                    )
                  ],
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
