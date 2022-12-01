import 'package:ecurie_party/Pages/actualites.dart';
import 'package:ecurie_party/Pages/event_form/event_form.dart';
import 'package:ecurie_party/Pages/profil.dart';
import 'package:ecurie_party/tools/constants.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/cupertino.dart';

import 'package:intl/intl.dart';
import '../add_event_page.dart';
import '../calendrier.dart';

class FormCourse extends StatefulWidget {
  const FormCourse({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FormCourse();
  }
}

class _FormCourse extends State<FormCourse> with EventForm {

  TextEditingController eventNameController = TextEditingController();

  String _dropDownDiscipline = "Discipline";
  String _dropDownLieux = "Lieux";

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(color: backgroundColor),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
              backgroundColor: buttonColor,
              centerTitle: true,
              title: const Text('Organiser un cours')),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
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
                                initialEntryMode: DatePickerEntryMode.calendar,
                                initialDatePickerMode: DatePickerMode.day,
                                builder: (context, child) {
                                  return Theme(
                                    data: Theme.of(context).copyWith(
                                        colorScheme: const ColorScheme.light(
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
                          child: buildDateTimePicker(timeVal != null
                              ? convertTime(timeVal)
                              : ''));
                    }),
            ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: DropdownButton(
                      hint: _dropDownDiscipline == null
                          ? const Text('Discipline')
                          : Text(
                              _dropDownDiscipline,
                              style: const TextStyle(color: Colors.blue),
                            ),
                      isExpanded: true,
                      iconSize: 30.0,
                      style: const TextStyle(color: Colors.blue),
                      items: ['Endurance', 'Entretient', 'Grand galop'].map(
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
                            _dropDownDiscipline = val!;
                          },
                        );
                      }),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: DropdownButton(
                      hint: _dropDownLieux == null
                          ? const Text('Lieu')
                          : Text(
                              _dropDownLieux,
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
                    "Finaliser",
                    style: TextStyle(
                      color: buttonColor,
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
