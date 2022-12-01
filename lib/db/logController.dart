import 'database.dart';

class logController {
  static final String collectionName = "log";

  static void getLog(DataBase db, int idLog){
    db.get(collectionName, {"id": idLog});
  }
}