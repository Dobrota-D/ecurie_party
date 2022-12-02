import 'package:ecurie_party/db/database.dart';
import 'package:ecurie_party/models/user.dart';
import 'package:flutter/material.dart';

import 'Pages/login.dart';
import 'main.reflectable.dart';

void main() {
  initializeReflectable();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static final DataBase myDb = DataBase("dbAdmin", "dbAdminPassword", "cluster0.oljmo2v.mongodb.net", "");
  static late User currentUser;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: login(),
    );
  }
}




