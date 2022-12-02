import 'package:ecurie_party/Pages/actualites.dart';
import 'package:ecurie_party/Pages/profil.dart';
import 'package:ecurie_party/db/event_controller.dart';
import 'package:ecurie_party/main.dart';
import 'package:ecurie_party/models/tournament.dart';
import 'package:ecurie_party/tools/constants.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';

import '../add_event_page.dart';
import '../calendrier.dart';
import 'event_form.dart';

class FormTournament extends StatefulWidget {
  const FormTournament({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FormTournament();
  }
}

class _FormTournament extends State<FormTournament> with EventForm {
  TextEditingController eventNameController = TextEditingController();
  TextEditingController eventImageController = TextEditingController();

  String _dropDownLocation = "Adresse";

  bool check1 = false;
  bool check2 = false;
  bool check3 = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: backgroundColor,
      // <-- SCAFFOLD WITH TRANSPARENT BG
      appBar: AppBar(
          backgroundColor: buttonColor,
          centerTitle: true,
          title: const Text('Organiser une compétition')),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    border: const UnderlineInputBorder(),
                    fillColor: buttonColor,
                    labelText: 'Nom de l\'évènement',
                  ),
                  controller: eventNameController,
                  validator: (textMail) {
                    if (textMail!.isEmpty) {
                      return 'Veuillez saisir un texte';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: const UnderlineInputBorder(),
                    fillColor: buttonColor,
                    labelText: 'URL Image',
                  ),
                  controller: eventImageController,
                  validator: (textMail) {
                    if (textMail!.isEmpty) {
                      return 'Veuillez saisir un texte';
                    }
                    return null;
                  },
                ),
                ValueListenableBuilder<DateTime?>(
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
                                initialEntryMode: DatePickerEntryMode.calendar,
                                initialDatePickerMode: DatePickerMode.day,
                                builder: (context, child) {
                                  return Theme(
                                    data: Theme.of(context).copyWith(
                                        colorScheme: const ColorScheme.light(
                                          primary: Colors.blueGrey,
                                        )),
                                    child: child!,
                                  );
                                });
                            dateSub.value = date;
                          },
                          child: buildDateTimePicker(
                              dateVal != null ? convertDate(dateVal) : ''));
                    }),
                ValueListenableBuilder<TimeOfDay?>(
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
                DropdownButton(
                    hint: Text(
                      _dropDownLocation,
                      style: const TextStyle(color: Colors.blue),
                    ),
                    isExpanded: true,
                    iconSize: 30.0,
                    style: const TextStyle(color: Colors.blue),
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
                          _dropDownLocation = val!;
                        },
                      );
                    }),
                CheckboxListTile(
                  //checkbox positioned at right
                  value: check1,
                  onChanged: (bool? value) {
                    setState(() => check1 = value!);
                  },
                  title: const Text("Petit pas"),
                ),
                CheckboxListTile(
                  //checkbox positioned at right
                  value: check2,
                  onChanged: (bool? value) {
                    setState(() => check2 = value!);
                  },
                  title: const Text("Moyen trot"),
                ),
                CheckboxListTile(
                  //checkbox positioned at right
                  value: check3,
                  onChanged: (bool? value) {
                    setState(() => check3 = value!);
                  },
                  title: const Text("Grand galop"),
                ),
                submitButton(context, () {
                  if (timeSubShort.value != null && dateSub.value != null && formKey.currentState!.validate() && (check3! || check2! || check1!) && _dropDownLocation != "Adresse") {
                    Tournament event = Tournament(0, eventNameController.text, EventController.tournament, MyApp.currentUser.id, [], dateSub.value!, _dropDownLocation, false, eventImageController.text, []);
                    EventController.prepare(MyApp.myDb, event);
                    Navigator.of(context).pop();
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
