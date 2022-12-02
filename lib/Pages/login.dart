
import 'package:ecurie_party/Pages/actualites.dart';
import 'package:ecurie_party/main.dart';
import 'package:ecurie_party/regex_reg.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/cupertino.dart';

import '../db/database.dart';

class login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _login();
  }
}

class _login extends State<login> {
  Color _colorFond = const Color(0xFFFFF3E0);
  Color _colorButton = const Color(0xFF730800);

  final _formKey = GlobalKey<FormState>();
  final NameController = TextEditingController();
  final FirstnameController = TextEditingController();
  final EmailController = TextEditingController();
  final PasswordController = TextEditingController();
  final ImageController = TextEditingController();

  getValues() {
    print(NameController.text);
    print(FirstnameController.text);
    print(EmailController.text);
    print(PasswordController.text);
  }
 late BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(color: _colorFond),
        ),

        Scaffold(
          backgroundColor: Colors.transparent,
          // <-- SCAFFOLD WITH TRANSPARENT BG

          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                    image: AssetImage("assets/images/LogoFlutter.png"),
                    fit: BoxFit.fill),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      fillColor: _colorButton,
                      labelText: 'Email',
                    ),
                    controller: EmailController,
                    validator: (textMail) {
                      if (textMail!.isEmpty) {
                        return 'Veuillez saisir un texte';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      fillColor: _colorButton,
                      labelText: 'Mot de passe',
                    ),
                    controller: PasswordController,
                    validator: (textMail) {
                      if (textMail!.isEmpty) {
                        return 'Veuillez saisir un texte';
                      }
                      return null;
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                            pageBuilder: (_, __, ___) => actualites()));
                    // do something

                    // accéder au fil d'actu
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    shadowColor: Colors.transparent.withOpacity(0.1),
                  ),
                  child: Text(
                    "Se connecter",
                    style: TextStyle(
                      fontSize: 22,
                      color: _colorButton,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        backgroundColor: _colorFond,
                        title: const Text("Créer un compte"),
                        content: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 16),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: UnderlineInputBorder(),
                                    fillColor: _colorButton,
                                    labelText: 'Nom',
                                  ),
                                  controller: NameController,
                                  validator: (textName) {
                                    if (textName == '') return 'Ce champs est obligatoire';
                                    else if (textName!.length < 4) return 'Le nom doit contenir plus de 3 Charactères';
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 16),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: UnderlineInputBorder(),
                                    fillColor: _colorButton,
                                    labelText: 'Prénom',
                                  ),
                                  controller: FirstnameController,
                                  validator: (textFirstName) {
                                    if (textFirstName == '') return 'Ce champs est obligatoire';
                                    else if (textFirstName!.length < 4) return "Le prénom doit contenir plus de 3 Charactères";
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 16),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: UnderlineInputBorder(),
                                    fillColor: _colorButton,
                                    labelText: 'Email',
                                  ),
                                  controller: EmailController,
                                  validator: (textMail) {
                                    if (textMail == '') return 'Ce champs est obligatoire';
                                    else if (!textMail!.isValidEmail()) return 'email invalide';
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 16),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: UnderlineInputBorder(),
                                    fillColor: _colorButton,
                                    labelText: 'Mot de passe',
                                  ),
                                  controller: PasswordController,
                                  validator: (textpass) {
                                    if (textpass =='') return 'Ce champs est obligatoire';
                                    else if (textpass!.length < 6) return 'Le mot de passe est invalide 5 charatères minimum';
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 16),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: UnderlineInputBorder(),
                                    fillColor: _colorButton,
                                    labelText: 'URL photo',
                                  ),
                                  controller: ImageController,
                                  validator: (textUrlImg) {
                                    if (textUrlImg!.isEmpty) return 'Veuillez saisir un texte';
                                    else if (textUrlImg!.length < 7) return 'url invalide';
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          ElevatedButton(
                            onPressed: () async {
                              var name = NameController.text;
                              var firstName = FirstnameController.text;
                              var email = EmailController.text;
                              var pwd = PasswordController.text;
                              var imageUrl = ImageController.text;


                              if (_formKey.currentState!.validate()) {
                                if (!await isUserExists(email, name)) {
                                  MyApp.myDb.createElement('users',
                                      {"name": name, "first name": firstName, "password": pwd, "email": email, "profileImg": imageUrl}
                                  ).then((value) {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (context) => actualites()),
                                    );
                                  });
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(primary: Colors.transparent,
                              shadowColor: Colors.transparent.withOpacity(0.1),
                            ),
                            child: Container(
                              color: _colorButton,
                              padding: const EdgeInsets.all(20),
                              child: Text(
                                "Créer",
                                style: TextStyle(
                                  color: _colorFond,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ); // RefreshList();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    shadowColor: Colors.transparent.withOpacity(0.1),
                  ),
                  child: Text(
                    "Créer un compte",
                    style: TextStyle(
                      fontSize: 22,
                      color: _colorButton,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
  isUserExists(String email, String name) async {
    Map<String, bool> errors = await MyApp.myDb.checkUserExists(email, name);
    if (errors["email"]!) {
      displaySnackBar('Cet email est déjà utilisé');
      return true;
    }
    return false;
  }

  displaySnackBar(String msg) {
    var snackBar = SnackBar(
        backgroundColor: Colors.red,
        content: Text(msg)
    );
    ScaffoldMessenger.of(_context).showSnackBar(snackBar);
  }
}