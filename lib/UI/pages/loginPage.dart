import 'package:flutter/material.dart';
import 'package:frontend/UI/pages.dart';
import 'package:frontend/UI/pages/signUpPage.dart';
import '../../model/Model.dart';
import '../../model/objects/Utente.dart';
import '../../model/support/LogInResult.dart';
import 'homepage.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool isObscured = true;
  String nomeUtente = "default";

  Future<void> fetchData() async {
    Utente? u = await Model.sharedInstance.getUserByEmail(_email.text);
    setState(() {
      nomeUtente = u!.nome;
      print('SETTATOO => ' + nomeUtente);
    });
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
        iconTheme: IconThemeData(color: Colors.black87),
      ),
      body: Stack(
        children: <Widget>[
          IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }),
          Padding(
            padding: const EdgeInsets.all(0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                //borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 20.0, // has the effect of softening the shadow
                  )
                ],
              ),
              child: Form(
                  child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                        alignment: Alignment.topCenter,
                        child: Icon(
                          Icons.account_circle,
                          size: 220,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey.withOpacity(0.3),
                      elevation: 0.0,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: TextFormField(
                          controller: _email,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Email",
                            icon: Icon(Icons.alternate_email),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey.withOpacity(0.3),
                      elevation: 0.0,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: TextFormField(
                          controller: _password,
                          obscureText: isObscured,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Password",
                              icon: Icon(Icons.lock_outline),
                              suffixIcon: IconButton(
                                icon: isObscured
                                    ? const Icon(Icons.visibility_outlined)
                                    : const Icon(Icons.visibility_off_outlined),
                                onPressed: () {
                                  setState(() {
                                    isObscured = !isObscured;
                                  });
                                },
                              )),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                    child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.yellowAccent,
                        elevation: 0.0,
                        child: MaterialButton(
                          onPressed: () async {
                            LogInResult loginResult = await Model.sharedInstance
                                .logIn(_email.text, _password.text);

                            if (loginResult == LogInResult.logged) {
                              Utente.utente = await Model.sharedInstance
                                  .getUserByEmail(_email.text);
                              if (Utente.utente != null) {
                                setState(() {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          content: Row(
                                            children: [
                                              Text(
                                                  'Log in effettuato!\nBenvenuto, ${Utente.utente!.nome.toUpperCase()}'),
                                              MaterialButton(
                                                onPressed: () {
                                                  //Navigator.pop(context);
                                                  //Navigator.pop(context);
                                                  /*Navigator.pushAndRemoveUntil(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            AreaPersonalePage()),
                                                    (Route<dynamic> route) =>
                                                        false,
                                                  );*/
                                                  Navigator.push(context, MaterialPageRoute(builder: (context) => AreaPersonalePage()));
                                                },
                                                child: Text("OK"),
                                              ),
                                            ],
                                          ),
                                        );
                                      });
                                });
                              }
                              /*Model.sharedInstance.logIn(_email.text, _password.text).then((value){
                                  if(value==LogInResult.logged){
                                    Model.sharedInstance.getUserByEmail(_email.text).then((value2){
                                        Utente.utente = value2;
                                    });
                                    fetchData();
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            content:  Row(
                                              children: [
                                                Text('Log in effettuato!\nBenvenuto, $nomeUtente'),
                                                MaterialButton(onPressed: (){
                                                  //Navigator.pushNamed(context, '/homepage');
                                                  Navigator.pop(context);
                                                }, child: Text("OK"),),
                                              ],
                                            ),
                                          );
                                        });
                                  }
                                  else{
                                    showDialog(context: context, builder: (BuildContext context){return AlertDialog(content: new Text ("Email o Password non valide.\nClicca sullo schermo per tornare indietro"),);});
                                    ;
                                  }
                                });*/
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      content: Text(
                                          "Email o Password non valide."),
                                    );
                                  });
                            }
                          },
                          minWidth: MediaQuery.of(context).size.width,
                          child: const Text(
                            "Login",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                          ),
                        )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(12),
                          child: Container(
                            child: TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => SignUp()));
                              },
                              child: Text("Non hai un account? Registrati"),
                            ),
                          )),
                    ],
                  ),
                ],
              )),
            ),
          ),
        ],
      ),
    );
  }
}
