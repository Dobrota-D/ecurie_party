import 'package:mongo_dart/mongo_dart.dart';

class DataBase {
  final String _user;
  final String _pwd;
  final String _host;
  final String _dbName;

  var db;

  DataBase(this._user, this._pwd, this._host, this._dbName);

  _init() async {
    db = await Db.create("mongodb+srv://$_user:$_pwd@$_host/$_dbName?retryWrites=true&w=majority");
    await db.open();
  }

  getCollection(String collectionName) async{
    if (db == null){ await _init(); }
    DbCollection collection = db.collection(collectionName);

    return await collection.find().toList();
  }

  get(String collectionName, Map<String, dynamic> selector) async{
    if (db == null){ await _init(); }
    DbCollection collection = db.collection(collectionName);

    return await collection.find(selector).toList();
  }

  update(String collectionName, Map<String, dynamic> selector, Map<String, dynamic> data) async{
    if (db == null){ await _init(); }
    DbCollection collection = db.collection(collectionName);

    return await collection.updateOne(where.raw(selector), data);
  }

  insert(String collectionName, Map<String, dynamic> data) async{
    if (db == null){ await _init(); }
    DbCollection collection = db.collection(collectionName);

    return await collection.insertOne(data);
  }

  delete(String collectionName, Map<String, dynamic> selector) async{
    if (db == null){ await _init(); }
    DbCollection collection = db.collection(collectionName);

    return await collection.deleteOne(where.raw(selector));
  }
}