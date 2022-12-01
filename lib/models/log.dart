import 'db_collection.dart';

@collection
class Log extends DbCollection{
  int id;
  DateTime date;
  String title;
  String message;

  Log(this.id, this.date, this.title, this.message);

  static Log init(Map<String, dynamic> data){
    return Log(data["id"], data["date"], data["title"],
        data["message"]);
  }
}