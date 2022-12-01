import 'package:ecurie_party/db/database.dart';
import 'package:ecurie_party/models/course.dart';
import 'package:ecurie_party/models/event.dart';
import 'package:ecurie_party/models/party.dart';
import 'package:ecurie_party/models/tournament.dart';

class EventController {
  static const String collectionName = "event";

  static const String tournament = "tournament";
  static const String party = "party";
  static const String course = "course";

  //Event object is initialise but it's missing some data
  static void prepare(DataBase db, Event event){

    EventController._create(db, event);
  }

  static void _create(DataBase db, Event event){
    db.insert(collectionName, event.toJson());
  }

  static void delete(DataBase db, Event event){
    db.delete(collectionName, event.toJson());
  }

  static void update(DataBase db, Event event){
    db.update(collectionName, event.toJson(), event.toJson());
  }

  static Event get(DataBase db, int idEvent){
    return EventController._createEventObject(db.get(collectionName, {"id": idEvent}));
  }

  static List<Event> getList(DataBase db, Map<String, dynamic> selector){
    List<Event> events = [];
    List<Map<String, dynamic>> listEvent = db.get(collectionName, selector);
    for (var event in listEvent){
      events.add(_createEventObject(event));
    }
    return events;
  }

  static Event _createEventObject(Map<String, dynamic> data){
    switch(data["eventType"]){
      case course:
        return Course.init(data);
      case tournament:
        return Tournament.init(data);
      case party:
        return Party.init(data);
      default:
        return Event.init(data);
    }
  }
}