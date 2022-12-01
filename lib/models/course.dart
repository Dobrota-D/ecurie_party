import 'package:ecurie_party/models/event.dart';

import 'db_collection.dart';

@collection
class Course extends Event {
  String terrainType;
  String duration;
  String discipline;

  Course(
      super.id,
      super.name,
      super.eventType,
      super.idUser,
      super.horsemenList,
      super.date,
      super.location,
      this.terrainType,
      this.duration,
      this.discipline);

  static Course init(Map<String, dynamic> data) {
    return Course(
        data["id"],
        data["name"],
        data["eventType"],
        data["idUser"],
        data["horsemenList"],
        data["date"],
        data["location"],
        data["terrainType"],
        data["duration"],
        data["discipline"]);
  }
}
