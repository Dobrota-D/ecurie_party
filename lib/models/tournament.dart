import 'package:ecurie_party/models/event.dart';

import 'db_collection.dart';

@collection
class Tournament extends Event{
  String photo;
  List<String> levels;

  Tournament(super.id, super.name, super.eventType, super.idUser, super.horsemenList, super.date, super.location, this.photo, this.levels);
}