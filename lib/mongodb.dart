import 'dart:developer';
import 'constant.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongoDatabase {
  static connect() async {
    var db = await Db.create(MONGO_URL);
    await db.open();
    inspect(db);
    var status = db.serverStatus();
    print(status);
    var collection = db.collection(COLLECTION_NAME);


    //add one
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

    print(await collection.find().toList());


    
    //update document
    await collection.update(where.eq('usename', 'mp'), modify.set('name', 'Findus Ecurry'));
    print(await collection.find().toList());
  }
}
