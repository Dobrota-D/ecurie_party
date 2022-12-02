import 'package:ecurie_party/models/user.dart';

import 'database.dart';

class UserController {
  static const String collectionName = "users";

  static Future<User?> getLoger(DataBase db, String mail, String pwd) async {
    List<Map<String, dynamic>> list = await db.get(collectionName, {"email": mail, "password": pwd});
    return list.isNotEmpty ? _userController(list.first) : null;
  }

  // update the user's name
  static void updateUserName(DataBase db, int idUser, String name) async{
    await db.update(collectionName, {"id": idUser}, {"name": name});
  }

  // update the user's email
  static void updateUserEmail(DataBase db, int idUser, String email) async {
    await db.update(collectionName, {"id": idUser}, {"email": email});
  }

  // update the user's password
  static void updateUserPassword(DataBase db, int idUser, String password) async {
    await db.update(collectionName, {"id": idUser}, {"password": password});
  }

  // delete the user
  static void deleteUser(DataBase db, int idUser) async {
    await db.delete(collectionName, {"id": idUser});
  }


  static User _userController(Map<String, dynamic> data) {
    return User.init(data);
  }
}
