import 'package:ecurie_party/Pages/add_event_page.dart';
import 'package:ecurie_party/Pages/profil.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:ecurie_party/Pages/calendrier.dart';
import 'cavalier_list.dart';
import 'cheval_list.dart';

class actualites extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _actualites();
  }
}

class _actualites extends State<actualites> {
  bool? isHere = false;
  bool? participation = false;

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
          backgroundColor: _colorBottumNavBar,
          appBar: AppBar(
              backgroundColor: _colorButton,
              centerTitle: true,
              title: Text('Fil d\'actualité')),
          bottomNavigationBar: BottomAppBar(
            color: _colorFond,

            // <-- APPBAR WITH TRANSPARENT BG
            elevation: 0,

            child: new Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                IconButton(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  icon: Icon(
                    Icons.article,
                    size: 40,
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
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  icon: Icon(
                    Icons.add,
                    size: 40,
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
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  icon: Icon(
                    Icons.calendar_month,
                    size: 40,
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
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  icon: Icon(
                    Icons.face,
                    color: _colorBottumNavBar,
                    size: 40,
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
          body: ListView(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              pageBuilder: (_, __, ___) => cavalier_list()));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      shadowColor: Colors.transparent.withOpacity(0.1),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 16),
                        child: Container(
                            width: 150,
                            height: 150,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset(
                                'assets/images/cavalier.jpg',
                                height: 100.0,
                                width: 100.0,
                                fit: BoxFit.cover,
                              ),
                            ))),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              pageBuilder: (_, __, ___) => cheval_list()));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      shadowColor: Colors.transparent.withOpacity(0.1),
                    ),
                    child: SizedBox(
                        width: 150,
                        height: 150,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset(
                            'assets/images/cheval.jpg',
                            height: 100.0,
                            width: 100.0,
                            fit: BoxFit.cover,
                          ),
                        )),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            backgroundColor: _colorFond,
                            title:  Text("Infos", style: TextStyle(color: _colorBottumNavBar)),
                            content: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 16),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20.0),
                                      child: Image.network(
                                        'https://blog.cap-adrenaline.com/wp-content/uploads/2022/03/equipement-cours-equitation.jpg',
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "Course d'endurance",
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: _colorBottumNavBar,
                                    ),
                                  ),
                                  Text(
                                    "\nCergy",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: _colorBottumNavBar,
                                    ),
                                  ),
                                  Text(
                                    "\n12/12 à 13:00",
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: _colorBottumNavBar,
                                    ),
                                  ),
                                  CheckboxListTile(
                                    value: participation,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        participation = value;
                                        Navigator.of(context).pop();
                                      });
                                    },
                                    title: Text("Je participe",  style: TextStyle(color: _colorBottumNavBar)),
                                  ),
                                ],
                              ),
                            ),
                          ));
                },
                child: Container(
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
                          //  leading: Icon(Icons.add, size: 70),
                          title: Text('Endurance : Cergy ',
                              style: TextStyle(
                                color: _colorBottumNavBar,
                                fontWeight: FontWeight.bold,
                              )),
                          subtitle: Text('12/12 à 13:00',
                              style: TextStyle(color: _colorBottumNavBar)),
                        ),
                        Visibility(
                          child: CheckboxListTile(
                            value: isHere,
                            onChanged: (bool? value) {
                              setState(() {
                                isHere = value;
                              });
                            },
                          ),
                          visible: false,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            backgroundColor: _colorFond,
                            title:  Text("Infos",  style: TextStyle(color: _colorBottumNavBar)),
                            content: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 16),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20.0),
                                      child: Image.network(
                                        'https://www.bowdenpr.co.uk/wp-content/uploads/2020/05/Hollie-Doyle-Flat-Jockey-297x300.jpg',
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "Concours Grand Galop",textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: _colorBottumNavBar,
                                    ),
                                  ),
                                  Text(
                                    "\nConflans",textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: _colorBottumNavBar,
                                    ),
                                  ),
                                  Text(
                                    "\n12/12 à 13:00",textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: _colorBottumNavBar,
                                    ),
                                  ),
                                  CheckboxListTile(
                                    value: participation,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        participation = value;
                                        Navigator.of(context).pop();
                                      });
                                    },
                                    title: Text("Je participe",  style: TextStyle(color: _colorBottumNavBar)),
                                  ),
                                ],
                              ),
                            ),
                          ));
                },
                child: Container(
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
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.network(
                              'https://www.bowdenpr.co.uk/wp-content/uploads/2020/05/Hollie-Doyle-Flat-Jockey-297x300.jpg',
                            ),
                          ),
                          title: Text('Concours grand galop',
                              style: TextStyle(
                                color: _colorBottumNavBar,
                                fontWeight: FontWeight.bold,
                              )),
                          subtitle: Text('12/12 à 13:00 Conflans',
                              style: TextStyle(color: _colorBottumNavBar)),
                        ),
                        Visibility(
                          child: CheckboxListTile(
                            value: isHere,
                            onChanged: (bool? value) {
                              setState(() {
                                isHere = value;
                              });
                            },
                          ),
                          visible: false,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            backgroundColor: _colorFond,
                            title:  Text("Infos" ,  style: TextStyle(color: _colorBottumNavBar)),
                            content: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 16),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20.0),
                                      child: Image.network(
                                        'https://photos.gammvert.fr/v5/products/fiche_590/50912-barbecue-charbon-weber-master-touch-e-5770-57-cm-noir-14.jpg',
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "Repas : la boucherie chevaline",
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: _colorBottumNavBar,
                                    ),
                                  ),
                                  Text(
                                    "\n16/12 à 19:00",textAlign: TextAlign.left,
                                    style: TextStyle(

                                      fontSize: 17,
                                      color: _colorBottumNavBar,
                                    ),
                                  ),
                                  CheckboxListTile(
                                    value: participation,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        participation = value;
                                        Navigator.of(context).pop();
                                      });
                                    },
                                    title: Text("Je participe",  style: TextStyle(color: _colorBottumNavBar, )),
                                  ),
                                ],
                              ),
                            ),
                          ));
                },
                child: Container(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: _colorFond,
                    elevation: 17,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          title: Text('Repas : La boucherie chevaline',
                              style: TextStyle(
                                color: _colorBottumNavBar,
                                fontWeight: FontWeight.bold,
                              )),
                          subtitle: Text('16/12 à 19:00',
                              style: TextStyle(
                                color: _colorBottumNavBar,
                              )),
                        ),
                        Visibility(
                          child: CheckboxListTile(
                            value: isHere,
                            onChanged: (bool? value) {
                              setState(() {
                                isHere = value;
                              });
                            },
                          ),
                          visible: false,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            backgroundColor: _colorFond,
                            title:  Text("Infos",  style: TextStyle(color: _colorBottumNavBar)),
                            content: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 16),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20.0),
                                      child: Image.network(
                                        'https://www.bowdenpr.co.uk/wp-content/uploads/2020/05/Hollie-5-300x225.jpg',
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "Nom Prénom",
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: _colorBottumNavBar,
                                    ),
                                  ),
                                  Text(
                                    "\nEmail",
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: _colorBottumNavBar,
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ));
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
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.network(
                              'https://www.bowdenpr.co.uk/wp-content/uploads/2020/05/Hollie-5-300x225.jpg',
                            ),
                          ),
                          title: Text('Nom',
                              style: TextStyle(
                                color: _colorBottumNavBar,
                                fontWeight: FontWeight.bold,
                              )),
                          subtitle: Text('Prenom',
                              style: TextStyle(color: _colorBottumNavBar)),
                        ),
                        Visibility(
                          child: CheckboxListTile(
                            value: isHere,
                            onChanged: (bool? value) {
                              setState(() {
                                isHere = value;
                              });
                            },
                          ),
                          visible: false,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
