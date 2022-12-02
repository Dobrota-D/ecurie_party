import 'package:ecurie_party/Pages/actualites.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/cupertino.dart';

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

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(color: _colorFond),
        ),

        Scaffold(
          backgroundColor: Colors.transparent,
          // <-- SCAFFOLD WITH TRANSPARENT BG
          resizeToAvoidBottomInset: false,
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
                                  validator: (textMail) {
                                    if (textMail!.isEmpty) {
                                      return 'Veuillez saisir un texte';
                                    }
                                    return null;
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
                                  validator: (textMail) {
                                    if (textMail!.isEmpty) {
                                      return 'Veuillez saisir un texte';
                                    }
                                    return null;
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
                                    if (textMail!.isEmpty) {
                                      return 'Veuillez saisir un texte';
                                    }
                                    return null;
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
                                  validator: (textMail) {
                                    if (textMail!.isEmpty) {
                                      return 'Veuillez saisir un texte';
                                    }
                                    return null;
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
                                  validator: (textMail) {
                                    if (textMail!.isEmpty) {
                                      return 'Veuillez saisir un texte';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          ElevatedButton(
                            onPressed: () {},
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
}
