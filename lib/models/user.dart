import 'db_collection.dart';

@collection
class User extends DbCollection {
  int id;
  String firstname;
  String name;
  String mail;
  String pwd;
  String pictProfile;
  bool isAdmin;

  User(this.id, this.firstname, this.name, this.mail, this.pwd, this.pictProfile, this.isAdmin);

  static User init(Map<String, dynamic> data) {
    return User(data["id"], data["firstname"], data["name"], data["mail"],
        data["pwd"], data["pictProfile"], data["isAdmin"]);
  }
}
