import 'database.dart';

class UserController {
  static const String collectionName = "users";

  static void getUser(DataBase db, int idUser) {
    db.get(collectionName, {"id": idUser});
  }

  // update the user's name
  static void updateUserName(DataBase db, int idUser, String name) {
    db.update(collectionName, {"id": idUser}, {"name": name});
  }

  // update the user's email
  static void updateUserEmail(DataBase db, int idUser, String email) {
    db.update(collectionName, {"id": idUser}, {"email": email});
  }

  // update the user's password
  static void updateUserPassword(DataBase db, int idUser, String password) {
    db.update(collectionName, {"id": idUser}, {"password": password});
  }

  // delete the user
  static void deleteUser(DataBase db, int idUser) {
    db.delete(collectionName, {"id": idUser});
  }
}
