import 'package:ecurie_party/db/database.dart';
import 'package:ecurie_party/models/log.dart';
import 'package:flutter/material.dart';

import 'Pages/login.dart';
import 'main.reflectable.dart';

void main() {
  initializeReflectable();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static final myDb = DataBase("dbAdmin", "dbAdminPassword", "cluster0.oljmo2v.mongodb.net", "");

  dbCall() async {
    var userList = await myDb.getCollection("users");
    print(userList);

    print(Log(1, DateTime.now(), "Test", "ttestsets").toJson());
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    dbCall();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: login(),
    );
  }
}




