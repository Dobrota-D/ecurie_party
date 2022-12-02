import 'package:ecurie_party/Pages/actualites.dart';
import 'package:ecurie_party/Pages/event_form/event_form.dart';
import 'package:ecurie_party/Pages/profil.dart';
import 'package:ecurie_party/db/event_controller.dart';
import 'package:ecurie_party/main.dart';
import 'package:ecurie_party/models/party.dart';
import 'package:ecurie_party/tools/constants.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui';

import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';

import '../add_event_page.dart';
import '../calendrier.dart';

class FormParty extends StatefulWidget {
  const FormParty({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FormParty();
  }
}

class _FormParty extends State<FormParty> with EventForm {
  TextEditingController eventNameController = TextEditingController();
  TextEditingController adressController = TextEditingController();

  String _dropDownEvent = "Thème de la soirée";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        // <-- SCAFFOLD WITH TRANSPARENT BG
        appBar: AppBar(
            backgroundColor: buttonColor,
            centerTitle: true,
            title: const Text('Organiser une soirée')),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      border: const UnderlineInputBorder(),
                      fillColor: buttonColor,
                      labelText: 'Nom de l\'évènement',
                    ),
                    controller: eventNameController,
                    validator: validator,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: const UnderlineInputBorder(),
                      fillColor: buttonColor,
                      labelText: 'Adresse',
                    ),
                    controller: adressController,
                    validator: validator,
                  ),
                  DropdownButton(
                      hint: Text(
                        _dropDownEvent,
                        style: const TextStyle(color: Colors.blue),
                      ),
                      isExpanded: true,
                      iconSize: 30.0,
                      style: const TextStyle(color: Colors.blue),
                      items: ['Convention', 'Apéro', 'Repas']
                          .map(
                            (val) => DropdownMenuItem<String>(
                              value: val,
                              child: Text(val),
                            ),
                          )
                          .toList(),
                      onChanged: (val) {
                        setState(() {
                          _dropDownEvent = val!;
                        });
                      }),
                  ValueListenableBuilder<DateTime?>(
                    valueListenable: dateSub,
                    builder: (context, dateVal, child) => InkWell(
                        onTap: () async {
                          DateTime? date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2050),
                            currentDate: DateTime.now(),
                            initialEntryMode: DatePickerEntryMode.calendar,
                            initialDatePickerMode: DatePickerMode.day,
                            builder: (context, child) => Theme(
                              data: Theme.of(context).copyWith(
                                  colorScheme: const ColorScheme.light(
                                primary: Colors.blueGrey,
                                // onSurface: AppColors.blackCoffee,
                              )),
                              child: child!,
                            ),
                          );
                          dateSub.value = date;
                        },
                        child: buildDateTimePicker(
                            dateVal != null ? convertDate(dateVal) : '')),
                  ),
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
                  submitButton(context,() {
                    if (timeSubShort.value != null && dateSub.value != null && formKey.currentState!.validate() && _dropDownEvent != "Thème de la soirée") {
                      Party event = Party(0, eventNameController.text, EventController.party, MyApp.currentUser.id, [], dateSub.value!, adressController.text, false, _dropDownEvent);
                      EventController.prepare(MyApp.myDb, event);
                      Navigator.of(context).pop();
                    }
                  }),
                ],
              ),
            ),
          ),
        ));
  }
}
