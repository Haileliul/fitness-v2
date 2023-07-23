import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';

class connection {
// final db = Db('mongodb://172.17.0.2:27017/Fittnes');
// await db.open();

  static dynamic db;
  static dynamic userCollection;

  static connect() async {
    db = await Db.create('mongodb://172.17.0.2:27017/Fittnes');
    await db.open();
    userCollection = db.collection('User');
    inspect(db);
    var status = db.serverStatus();
    print(status);
  }
}
