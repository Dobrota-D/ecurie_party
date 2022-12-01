import 'package:ecurie_party/Pages/actualites.dart';
import 'package:ecurie_party/Pages/calendrier.dart';
import 'package:ecurie_party/Pages/form_event.dart';
import 'package:ecurie_party/Pages/profil.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/cupertino.dart';

import 'package:ecurie_party/Pages/calendrier.dart';

import 'form_concours.dart';
import 'form_cours.dart';

class add_event_page extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _add_event_page();
  }
}

class _add_event_page extends State<add_event_page> {
  Color _colorFond = const Color(0xFFFFF3E0);
  Color _colorButton = const Color(0xFF730800);
  Color _colorBottumNavBar = const Color(0xFF8D6E63);

  final _formKey = GlobalKey<FormState>();
  TextEditingController NameController = TextEditingController();
  TextEditingController FirstnameController = TextEditingController();
  TextEditingController MailController = TextEditingController();

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
              backgroundColor: _colorButton,
              centerTitle: true,
              title: Text('Créer des évènements')),
          bottomNavigationBar: BottomAppBar(
            color: _colorFond,
            // <-- APPBAR WITH TRANSPARENT BG
            elevation: 0,

            child: new Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.article,size: 40,
                    color: _colorBottumNavBar,
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
                    Icons.add,size: 40,
                    color: _colorBottumNavBar,
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
                    Icons.calendar_month,size: 40,
                    color: _colorBottumNavBar,
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
                    color: _colorBottumNavBar,size: 40,
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
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageRouteBuilder(
                                  pageBuilder: (_, __, ___) =>
                                      form_concours()));
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
                                  leading: Icon(Icons.add, size: 70,color:_colorBottumNavBar,),
                                  title: Text('Ajouter une course',
                                      style: TextStyle(color:_colorBottumNavBar,)),
                                ),
                                Text('', style: TextStyle(color: Colors.white)),
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
                                  pageBuilder: (_, __, ___) => form_event()));
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
                                  leading: Icon(Icons.add, size: 70,color:_colorBottumNavBar,),
                                  title: Text('Ajouter un évènement',
                                      style: TextStyle(color:_colorBottumNavBar,)),
                                ),
                                Text('', style: TextStyle(color:_colorBottumNavBar,)),
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
                            color: _colorFond,
                            elevation: 10,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children:  [
                                ListTile(
                                  leading: Icon(Icons.add, size: 70, color:_colorBottumNavBar,),
                                  title: Text('Ajouter un cours',
                                      style: TextStyle(color: _colorBottumNavBar)),
                                ),
                                Text('', style: TextStyle(color: Colors.white)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
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
