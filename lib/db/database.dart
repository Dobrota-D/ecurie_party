import 'package:mongo_dart/mongo_dart.dart';

/*
var status = db.serverStatus();
    print(status);
    var collection = db.collection(COLLECTION_NAME);

    //region add one
    /*
    await collection.insertOne({
      "usename" : "mp",
      "name" : "Spank maiyasse",
      "email" : "dfghjkl@gmail.com"
    });*/



    //add many
    /*await collection.insertMany([
      {
        "usename": "mp1",
        "name": "Spank1 maiyasse1",
        "email": "dfghjkl@gmail.com1"
      },
      {
        "usename": "mp2",
        "name": "Spank2 maiyasse2",
        "email": "dfghjkl@gmail.com2"
      },
      {
        "usename": "mp3",
        "name": "Spank3 maiyasse3",
        "email": "dfghjkl@gmail.com3"
      },
    ]);*/
    //endregion

    print(await collection.find().toList());

    //update document
    await collection.update(where.eq('usename', 'mp'), modify.set('name', 'Findus EcurryFuture<List<Map<String, dynamic>>>'));
    //print(await collection.find().toList());
 */
class DataBase {
  String user;
  String pwd;
  String host;
  String dbName;

  var db;

  DataBase(this.user, this.pwd, this.host, this.dbName);

  _init() async {
    db = await Db.create("mongodb+srv://$user:$pwd@$host/$dbName?retryWrites=true&w=majority");
    await db.open();
  }

  getCollection(String collectionName) async{
    if (db == null){ await _init(); }
    return await db.collection(collectionName);
  }

  update(String collectionName, String data) async{
    if (db == null){ await _init(); }
    return await db.collection(collectionName);
  }

  insert(String collectionName, String data) async{
    if (db == null){ await _init(); }
    return await db.collection(collectionName);
  }

  delete(String collectionName, String data) async{
    if (db == null){ await _init(); }
    return await db.collection(collectionName);
  }
}