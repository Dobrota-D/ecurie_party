import 'package:ecurie_party/Pages/actualites.dart';
import 'package:ecurie_party/Pages/calendrier.dart';
import 'package:ecurie_party/Pages/event_form/form_party.dart';
import 'package:ecurie_party/Pages/profil.dart';
import 'package:flutter/material.dart';

import 'event_form/form_tournament.dart';
import 'event_form/form_course.dart';

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
              title: const Text('Créer des évènements')),
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
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageRouteBuilder(
                                  pageBuilder: (_, __, ___) => const FormTournament()));
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
                              children: [
                                ListTile(
                                  leading: const Icon(Icons.add, size: 70),
                                  title: Text('Organiser une compétition',
                                      style: TextStyle(color: _colorBottumNavBar)),
                                ),
                                const Text(''),
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
                                  pageBuilder: (_, __, ___) => const FormParty()));
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
                                  leading: const Icon(Icons.add, size: 70),
                                  title: Text('Organiser une soirée',
                                      style: TextStyle(color: _colorBottumNavBar)),
                                ),
                                const Text(''),
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
                                  pageBuilder: (_, __, ___) => const FormCourse()));
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
                              children: [
                                ListTile(
                                  leading: const Icon(Icons.add, size: 70),
                                  title: Text('Organiser un cours',
                                      style: TextStyle(color: _colorBottumNavBar)),
                                ),
                                const Text(''),
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
