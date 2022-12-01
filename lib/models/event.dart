import 'db_collection.dart';

@collection
class Event extends DbCollection{
  int id;
  String name;
  String eventType;
  int idUser; //The One that own the event
  List<int> horsemenList;
  DateTime date;
  String location;

  Event(this.id, this.name, this.eventType, this.idUser, this.horsemenList,
      this.date, this.location);
}