import 'package:ecurie_party/Pages/actualites.dart';
import 'package:ecurie_party/Pages/profil.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:intl/intl.dart';
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
  final ValueNotifier<DateTime?> dateSub = ValueNotifier(null);
  final ValueNotifier<DateTime?> longDateSub = ValueNotifier(null);
  final ValueNotifier<TimeOfDay?> timeSub = ValueNotifier(null);
  final ValueNotifier<TimeOfDay?> timeSubShort = ValueNotifier(null);
  final TextEditingController meetingName = TextEditingController();
  final TextEditingController meetingLink = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  TextEditingController EventNameController = TextEditingController();
  TextEditingController EventImageController = TextEditingController();

  String _dropDownDiscipline = "Discipline";
  String _dropDownLieux = "Lieux";

  bool value = false;

  @override
  Widget build(BuildContext context) {
    Color _colorFond = const Color(0xFFFFF3E0);
    Color _colorButton = const Color(0xFF730800);
    Color _colorBottumNavBar = const Color(0xFF8D6E63);

    bool? check1 = false;
    bool? check2 = false;
    bool? check3 = false;


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
                  child: ValueListenableBuilder<DateTime?>(
                      valueListenable: dateSub,
                      builder: (context, dateVal, child) {
                        return InkWell(
                            onTap: () async {
                              DateTime? date = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2050),
                                  currentDate: DateTime.now(),
                                  initialEntryMode:
                                      DatePickerEntryMode.calendar,
                                  initialDatePickerMode: DatePickerMode.day,
                                  builder: (context, child) {
                                    return Theme(
                                      data: Theme.of(context).copyWith(
                                          colorScheme: ColorScheme.light(
                                        primary: Colors.blueGrey,
                                        // onSurface: AppColors.blackCoffee,
                                      )),
                                      child: child!,
                                    );
                                  });
                              dateSub.value = date;
                            },
                            child: buildDateTimePicker(
                                dateVal != null ? convertDate(dateVal) : ''));
                      }),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: ValueListenableBuilder<TimeOfDay?>(
                      valueListenable: timeSubShort,
                      builder: (context, timeVal, child) {
                        return InkWell(
                            onTap: () async {
                              TimeOfDay? time = await showTimePicker(
                                context: context,
                                builder: (context, child) {
                                  return Theme(
                                    data: Theme.of(context),
                                    child: child!,
                                  );
                                },
                                initialTime: TimeOfDay.now(),
                              );
                              timeSubShort.value = time;
                            },
                            child: buildDateTimePicker(
                                timeVal != null ? convertTime(timeVal) : ''));
                      }),
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


                CheckboxListTile(
                  //checkbox positioned at right
                  value: check1,
                  onChanged: (bool? value) {
                    setState(() {
                      check1 = value;
                    });
                  },
                  title: Text("Petit pas"),
                ),
                CheckboxListTile(
                  //checkbox positioned at right
                  value: check2,
                  onChanged: (bool? value) {
                    setState(() {
                      check2 = value;
                    });
                  },
                  title: Text("Moyen trot"),
                ),
                CheckboxListTile(
                  //checkbox positioned at right
                  value: check3,
                  onChanged: (bool? value) {
                    setState(() {
                      check3 = value;
                    });
                  },
                  title: Text("Grand galop"),
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
        ),
      ],
    );
  }

  String convertDate(DateTime dateTime) {
    return DateFormat('dd/MM/yyyy').format(dateTime);
  }

  String longDate(DateTime dateTime) {
    return DateFormat('EEE, MMM d, yyy').format(dateTime);
  }

  String convertTime(TimeOfDay timeOfDay) {
    DateTime tempDate = DateFormat('hh:mm')
        .parse(timeOfDay.hour.toString() + ':' + timeOfDay.minute.toString());
    var dateFormat = DateFormat('h:mm a');
    return dateFormat.format(tempDate);
  }

  Widget buildDateTimePicker(String data) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(color: Colors.black, width: 1.5),
      ),
      title: Text(data),
      trailing: const Icon(
        Icons.calendar_today,
        // color: AppColors.eggPlant,
      ),
    );
  }
}
