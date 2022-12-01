import 'package:ecurie_party/models/event.dart';

import 'db_collection.dart';

@collection
class Course extends Event{
  String terrainType;
  String duration;
  String discipline;

  Course(super.id, super.name, super.eventType, super.idUser, super.horsemenList, super.date, super.location, this.terrainType, this.duration, this.discipline);
}