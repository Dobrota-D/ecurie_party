import 'package:ecurie_party/Pages/actualites.dart';
import 'package:ecurie_party/Pages/calendrier.dart';
import 'package:ecurie_party/Pages/login.dart';
import 'package:ecurie_party/Pages/profil.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'add_event_page.dart';
import 'form_cours.dart';

class profil extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _profil();
  }
}

class _profil extends State<profil> {
  Color _colorFond = const Color(0xFFFFF3E0);
  Color _colorButton = const Color(0xFFB71C1C);
  Color _colorBottumNavBar = const Color(0xFF8D6E63);

  final _formKey = GlobalKey<FormState>();
  final NameController = TextEditingController();
  final FirstnameController = TextEditingController();
  final EmailController = TextEditingController();
  final PasswordController = TextEditingController();
  final ImageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: _colorFond,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          // <-- SCAFFOLD WITH TRANSPARENT BG
          appBar: AppBar(
              // <-- APPBAR WITH TRANSPARENT BG
              elevation: 0,
              backgroundColor: _colorButton,
              centerTitle: true,
              title: Text('Mon compte')),
          bottomNavigationBar: BottomAppBar(
            color: _colorBottumNavBar,
            // <-- APPBAR WITH TRANSPARENT BG
            elevation: 0,

            child: new Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.article,
                    color: _colorFond,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                            pageBuilder: (_, __, ___) => actualites()));
                    // do something
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.add,
                    color: _colorFond,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                            pageBuilder: (_, __, ___) => add_event_page()));
                    // do something
                  },
                ),

                IconButton(
                  icon: Icon(
                    Icons.calendar_month,
                    color: _colorFond,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                            pageBuilder: (_, __, ___) => calendrier()));
                    // do something
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.face,
                    color: _colorFond,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                            pageBuilder: (_, __, ___) => profil()));
                    // do something
                  },
                ),
                // IconButton(icon: Icon(Icons.search), onPressed: () {},),
              ],
            ),
          ),
          body: Center(
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child:  Image.network(
                    'https://www.bowdenpr.co.uk/wp-content/uploads/2020/05/Hollie-5-300x225.jpg',
                  ),
                ),



                Text(
                  "Nom",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                Text(
                  "Prénom",
                  style: TextStyle(
                    fontSize: 30,

                  ),
                ),
                GestureDetector(
                  onTap: () {
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
                                "Modifier",
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
                  child: Container(
                    width: 500,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: _colorBottumNavBar,
                      elevation: 10,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          ListTile(
                            title: Text('Modifier son profil',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        PageRouteBuilder(pageBuilder: (_, __, ___) => login()));
                  },
                  child: Container(
                    width: 500,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: _colorBottumNavBar,
                      elevation: 10,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          ListTile(
                            title: Text('Se déconnecter',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                            pageBuilder: (_, __, ___) => form_cours()));
                  },
                  child: Container(
                    width: 500,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: _colorBottumNavBar,
                      elevation: 10,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          ListTile(
                            title: Text('Supprimer son compte',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
