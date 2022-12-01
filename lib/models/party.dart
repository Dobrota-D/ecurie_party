import 'db_collection.dart';
import 'event.dart';

@collection
class Party extends Event {
  String theme;

  Party(super.id, super.name, super.eventType, super.idUser, super.horsemenList,
      super.date, super.location, super.isAuthorise, this.theme);

  static Party init(Map<String, dynamic> data) {
    return Party(
        data["id"],
        data["name"],
        data["eventType"],
        data["idUser"],
        data["isAuthorise"],
        data["horsemenList"],
        data["date"],
        data["location"],
        data["theme"]);
  }
}
