import 'database.dart';

class UserController {

  static final String collectionName = "users";

  static void getUser(DataBase db, int idUser){
    db.get(collectionName, {"id": idUser});
  }
}