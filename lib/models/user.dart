class User{
  int id;
  String firstname;
  String name;
  String mail;
  String pwd;
  int userType;
  bool isAdmin;

  User(this.id, this.firstname, this.name, this.mail, this.pwd, this.userType, this.isAdmin);

  toJson(){
    return {
      "id": id,
      "firstname": firstname,
      "name": name,
      "mail": mail,
      "password": pwd,
      "userType": userType,
      "idAdmin": isAdmin,
    };
  }
}