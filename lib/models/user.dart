import 'package:ecurie_party/models/db_collection.dart';

@reflector
class User extends DbCollection{
  int id;
  String firstname;
  String name;
  String mail;
  String pwd;
  int userType;
  bool isAdmin;

  User(this.id, this.firstname, this.name, this.mail, this.pwd, this.userType,
      this.isAdmin);
}