import '../models/log.dart';
import 'database.dart';


class LogController {
  static const String collectionName = "log";

  static Log getLog(DataBase db, int idLog){
   return LogController._logController(db.get(collectionName, {"id": idLog}));

  }

  static List<Log> getListLog(DataBase db){
    List<Log> logs = [];
    List<Map<String, dynamic>> listLog = db.getCollection(collectionName);
    for (var log in listLog){
      logs.add(_logController(log));
    }
    return logs;
  }

  static void create(DataBase db, Log log){
    db.insert(collectionName, log.toJson());
  }

  static Log _logController(Map<String, dynamic> data){
    return Log.init(data);
  }
}