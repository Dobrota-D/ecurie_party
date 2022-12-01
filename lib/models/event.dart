import 'db_collection.dart';

@collection
class Event extends DbCollection{
  int id;
  String name;
  String eventType;
  int idUser; //The One that own the event
  List<int> horsemenList;
  String? theme;
  DateTime date;

  Event(this.id, this.name, this.eventType, this.idUser, this.horsemenList,
      this.theme, this.date);
}