class Horse{
  int id;
  String name;
  String color;
  int age;
  int idUser;

  Horse(this.id, this.name, this.color, this.age, this.idUser);

  toJson(){
    return {
      "id": id,
      "name": name,
      "color": color,
      "age": age,
      "idUser": idUser,
    };
  }
}