import 'db_collection.dart';

@reflector
class Log extends DbCollection{
  int id;
  DateTime date;
  String title;
  String message;

  Log(this.id, this.date, this.title, this.message);
}