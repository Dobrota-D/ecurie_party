import 'package:ecurie_party/models/db_collection.dart';

@reflector
class Horse extends DbCollection{
  int id;
  String name;
  String color;
  int age;
  int idUser;

  Horse(this.id, this.name, this.color, this.age, this.idUser);
}