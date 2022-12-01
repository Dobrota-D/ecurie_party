import 'package:app_gestion_ecurie/Pages/profil.dart';
import 'package:app_gestion_ecurie/Pages/user.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/cupertino.dart';

import 'actualites.dart';
import 'add_event_page.dart';
import 'calendrier.dart';

class cavalier_list extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _cavalier_list();
  }
}

class _cavalier_list extends State<cavalier_list> {
  Widget CreateCard(User user) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: _colorBottumNavBar,
      elevation: 10,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                'https://www.bowdenpr.co.uk/wp-content/uploads/2020/05/Hollie-Doyle-Flat-Jockey-297x300.jpg',
                //image
              ),
            ),
            title: Text('Nom',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )),
            subtitle: Text('Prénom',
                style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  var list_card = [];

  void RefreshList(User user) {
    setState(() {
      list_card.add(CreateCard(user));
    });
  }

  Color _colorFond = const Color(0xFFFFF3E0);
  Color _colorButton = const Color(0xFFB71C1C);
  Color _colorBottumNavBar = const Color(0xFF8D6E63);

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
              title: Text('Liste des cavaliers')),
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

          body: ListView.builder(
              itemCount: list_card.length,
              itemBuilder: (BuildContext context, int index) {
                return list_card[index];

              }),
        ),
      ],
    );
  }
}
