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
  bool isAuthorise;

  Event(this.id, this.name, this.eventType, this.idUser, this.horsemenList,
      this.date, this.location, this.isAuthorise);

  static Event init(Map<String, dynamic> data){
    return Event(data["id"], data["name"], data["eventType"],
        data["idUser"], data["horsemenList"], data["date"], data["location"], data["isAuthorise"]);
  }
}