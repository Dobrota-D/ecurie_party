import '../models/log.dart';
import 'database.dart';


class LogController {
  static const String collectionName = "log";

  static Future<Log> getLog(DataBase db, int idLog) async {
   return LogController._logController(await db.get(collectionName, {"id": idLog}));

  }

  static Future<List<Log>> getListLog(DataBase db) async {
    List<Log> logs = [];
    List<Map<String, dynamic>> listLog = await db.getCollection(collectionName);
    for (var log in listLog){
      logs.add(_logController(log));
    }
    return logs;
  }

  static void create(DataBase db, Log log) async {
    await db.insert(collectionName, log.toJson());
  }

  static Log _logController(Map<String, dynamic> data){
    return Log.init(data);
  }
}