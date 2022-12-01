import 'package:ecurie_party/Pages/actualites.dart';
import 'package:ecurie_party/Pages/profil.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/cupertino.dart';

import 'add_event_page.dart';
import 'calendrier.dart';

class form_concours extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _form_concours();
  }
}

class _form_concours extends State<form_concours> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController EventNameController = TextEditingController();
  TextEditingController EventImageController = TextEditingController();

  String _dropDownDiscipline = "Discipline";
  String _dropDownLieux = "Lieux";

  @override
  Widget build(BuildContext context) {
    Color _colorFond = const Color(0xFFFFF3E0);
    Color _colorButton = const Color(0xFFB71C1C);
    Color _colorBottumNavBar = const Color(0xFF8D6E63);

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(color: _colorFond),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          // <-- SCAFFOLD WITH TRANSPARENT BG
          appBar: AppBar(
              backgroundColor: _colorButton,
              centerTitle: true,
              title: Text('Créer une course')),
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      fillColor: _colorButton,
                      labelText: 'Nom de l\'évènement',
                    ),
                    controller: EventNameController,
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
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      fillColor: _colorButton,
                      labelText: 'URL Image',
                    ),
                    controller: EventImageController,
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
                  child: DropdownButton(
                      hint: _dropDownLieux == null
                          ? Text('Lieu')
                          : Text(
                              _dropDownLieux,
                              style: TextStyle(color: Colors.blue),
                            ),
                      isExpanded: true,
                      iconSize: 30.0,
                      style: TextStyle(color: Colors.blue),
                      items: ['Cergy', 'Conflans', 'Pontoise'].map(
                        (val) {
                          return DropdownMenuItem<String>(
                            value: val,
                            child: Text(val),
                          );
                        },
                      ).toList(),
                      onChanged: (val) {
                        setState(
                          () {
                            _dropDownLieux = val!;
                          },
                        );
                      }),
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
                    "Créer une course",
                    style: TextStyle(
                      color: _colorButton,
                      fontSize: 22,
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
