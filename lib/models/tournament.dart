import 'package:ecurie_party/models/event.dart';

import 'db_collection.dart';

@collection
class Tournament extends Event {
  String photo;
  List<String> levels;

  Tournament(
      super.id,
      super.name,
      super.eventType,
      super.idUser,
      super.horsemenList,
      super.date,
      super.location,
      super.isAuthorise,
      this.photo,
      this.levels);

  static Tournament init(Map<String, dynamic> data) {
    return Tournament(
        data["id"],
        data["name"],
        data["eventType"],
        data["idUser"],
        data["horsemenList"],
        data["date"],
        data["location"],
        data["isAuthorise"],
        data["photo"],
        data["levels"]);
  }
}
