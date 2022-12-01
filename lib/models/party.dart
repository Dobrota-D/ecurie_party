import 'db_collection.dart';
import 'event.dart';

@collection
class Party extends Event{
  String theme;

  Party(super.id, super.name, super.eventType, super.idUser, super.horsemenList, super.date, super.location, this.theme);
}