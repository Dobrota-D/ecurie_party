
import '../models/user.dart';

import 'database.dart';

class UserController {
  static const String collectionName = "users";

  static Future<User?> getLoger(DataBase db, String mail, String pwd) async {
    List<Map<String, dynamic>> list =
        await db.get(collectionName, {"mail": mail, "pwd": pwd});
    return list.isNotEmpty ? _userController(list.first) : null;
  }

  // registration of a new user in the database
  static void registerUser(DataBase db, User user) {
    db.insert(collectionName, user.toJson());
  }

  // update the user's name
  static void updateUserName(DataBase db, int idUser, String name) async {
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
  static Future<List<User>> getListUser(DataBase db) async {
    List<User> users = [];
    List<Map<String, dynamic>> listUsers = await db.getCollection(collectionName);
    for (var horse in listUsers){
      users.add(_userController(horse));
    }
    return users;
  }
}
