import 'package:ecurie_party/Pages/actualites.dart';
import 'package:ecurie_party/Pages/calendrier.dart';
import 'package:ecurie_party/Pages/login.dart';
import 'package:ecurie_party/Pages/profil.dart';
import 'package:ecurie_party/main.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'add_event_page.dart';
import 'event_form/form_course.dart';

class profil extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _profil();
  }
}

class _profil extends State<profil> {
  Color _colorFond = const Color(0xFFFFF3E0);
  Color _colorButton = const Color(0xFF730800);
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
            color: _colorBottumNavBar,
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
              title: const Text('Mon compte')),
          bottomNavigationBar: BottomAppBar(
            color: _colorFond,

            // <-- APPBAR WITH TRANSPARENT BG
            elevation: 0,

            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                IconButton(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  icon: Icon(
                    Icons.article,
                    size: 40,
                    color: _colorBottumNavBar,
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                            pageBuilder: (_, __, ___) => actualites()));
                    // do something
                  },
                ),
                IconButton(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  icon: Icon(
                    Icons.add,
                    size: 40,
                    color: _colorBottumNavBar,
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                            pageBuilder: (_, __, ___) => add_event_page()));
                    // do something
                  },
                ),

                IconButton(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  icon: Icon(
                    Icons.calendar_month,
                    size: 40,
                    color: _colorBottumNavBar,
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                            pageBuilder: (_, __, ___) => calendrier()));
                    // do something
                  },
                ),
                IconButton(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  icon: Icon(
                    Icons.face,
                    color: _colorBottumNavBar,
                    size: 40,
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
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
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.network(
                      'https://www.bowdenpr.co.uk/wp-content/uploads/2020/05/Hollie-5-300x225.jpg',
                    ),
                  ),
                ),
                Text(
                  MyApp.currentUser.name,
                  style: TextStyle(
                    fontSize: 30,
                    color: _colorFond,
                  ),
                ),
                Text(
                  MyApp.currentUser.firstname,
                  style: TextStyle(
                    fontSize: 30,
                    color: _colorFond,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        backgroundColor: _colorFond,
                        title: const Text("Modifier son profil"),
                        content: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 16),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: const UnderlineInputBorder(),
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
                                    border: const UnderlineInputBorder(),
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
                                    border: const UnderlineInputBorder(),
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
                                    border: const UnderlineInputBorder(),
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
                                    border: const UnderlineInputBorder(),
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
                            style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
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
                      color: _colorFond,
                      elevation: 10,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children:  [
                          ListTile(
                            title: Text('Modifier son profil',
                                style: TextStyle(color: _colorBottumNavBar)),
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
                      color: _colorFond,
                      elevation: 10,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children:  [
                          ListTile(
                            title: Text('Se déconnecter',
                                style: TextStyle(color: _colorBottumNavBar)),
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
                      color: _colorFond,
                      elevation: 10,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children:  [
                          ListTile(
                            title: Text('Supprimer son compte',
                                style: TextStyle(color: _colorBottumNavBar)),
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
