import 'package:ecurie_party/models/db_collection.dart';

@collection
class Horse extends DbCollection{
  int id;
  String name;
  String color;
  int age;
  int idUser;
  String fur;
  String race;
  String sex;
  String speciality;
  String owner;

  Horse(this.id, this.name, this.color, this.age, this.idUser, this.fur, this.race, this.sex, this.speciality, this.owner);

  static Horse init(Map<String, dynamic> data){
    return Horse(data["id"], data["name"], data["color"],
        data["age"], data["idUser"], data["fur"], data["race"], data["sex"], data["speciality"],data["owner"]);
  }
}