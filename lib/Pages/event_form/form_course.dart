import 'package:ecurie_party/Pages/actualites.dart';
import 'package:ecurie_party/Pages/event_form/event_form.dart';
import 'package:ecurie_party/Pages/profil.dart';
import 'package:ecurie_party/db/event_controller.dart';
import 'package:ecurie_party/main.dart';
import 'package:ecurie_party/models/course.dart';
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
  String _dropDownLocation = "Adresse";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: buttonColor,
        centerTitle: true,
        title: const Text('Organiser un cours')),
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
                                initialEntryMode:
                                DatePickerEntryMode.calendar,
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
                      setState(() { _dropDownLocation = val!; });
                    }),
                submitButton(context, () {
                  if (timeSubShort.value != null && dateSub.value != null && formKey.currentState!.validate() && _dropDownLocation != "Adresse" && _dropDownDiscipline != "Discipline") {
                    Course event = Course(0, eventNameController.text, EventController.course, MyApp.currentUser.id, [], dateSub.value!, _dropDownLocation, false, "Terre battue", timeSubShort.value!.toString(), _dropDownDiscipline);
                    EventController.prepare(MyApp.myDb, event);
                    Navigator.of(context).pop();
                  }
                }),
              ],
            ),
          ),
        ),
      )
    );
  }
}
