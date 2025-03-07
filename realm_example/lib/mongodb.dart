import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:realm_example/constant.dart';

class MongoDatabase {
  static connect() async {
    var db = await Db.create(MONGO_URL);
    await db.open();
    inspect(db);
    var status =db.serverStatus();
    print(status);
    var collection = db.collection(COLLECTION_NAME);
    await collection.insertOne(
      {
        "car":"Tesla",
        "model": "Model Y", 
        "kilometers": 1
      }
    );
    print(await collection.find().toList());
  }
}