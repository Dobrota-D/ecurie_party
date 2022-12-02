import '../models/horse.dart';
import 'database.dart';


class HorseController {
  static const String collectionName = "horse";

  static Future<Horse?> getHorse(DataBase db, int idHorse)async{
   List <Map<String, dynamic>> list = await db.get(collectionName, {"id": idHorse});
    return list.isNotEmpty ? _horseController(list.first) : null;

  }

  static Future<List<Horse>> getListHorse(DataBase db) async {
    List<Horse> horses = [];
    List<Map<String, dynamic>> listHorse = await db.getCollection(collectionName);
    for (var horse in listHorse){
      horses.add(_horseController(horse));
    }
    return horses;
  }

  static create(DataBase db, Horse horse) async {
    await db.insert(collectionName, horse.toJson());
  }

  static Horse _horseController(Map<String, dynamic> data){
    return Horse.init(data);
  }
}