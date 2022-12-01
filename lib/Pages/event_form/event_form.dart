import 'package:ecurie_party/tools/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../actualites.dart';

class EventForm{
 final ValueNotifier<DateTime?> dateSub = ValueNotifier(null);
 final ValueNotifier<TimeOfDay?> timeSubShort = ValueNotifier(null);

 final _formKey = GlobalKey<FormState>();

 String convertDate(DateTime dateTime) {
   return DateFormat('dd/MM/yyyy').format(dateTime);
 }

 String longDate(DateTime dateTime) {
   return DateFormat('EEE, MMM d, yyy').format(dateTime);
 }

 String convertTime(TimeOfDay timeOfDay) {
   DateTime tempDate = DateFormat('hh:mm')
       .parse('${timeOfDay.hour}:${timeOfDay.minute}');
   var dateFormat = DateFormat('h:mm a');
   return dateFormat.format(tempDate);
 }

 Widget buildDateTimePicker(String data) {
   return ListTile(
     shape: RoundedRectangleBorder(
       borderRadius: BorderRadius.circular(10.0),
       side: const BorderSide(color: Colors.black, width: 1.5),
     ),
     title: Text(data),
     trailing: const Icon(
       Icons.calendar_today,
       // color: AppColors.eggPlant,
     ),
   );
 }
 Widget submitButton(BuildContext context){
  return ElevatedButton(
    onPressed: () {
      Navigator.push(
          context,
          PageRouteBuilder(
              pageBuilder: (_, __, ___) => actualites()));
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
  );
 }
}