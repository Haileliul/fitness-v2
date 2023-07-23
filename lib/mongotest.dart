import 'package:flutter/material.dart';
import './database.dart';
import 'model/usermodel.dart';

class mongotest extends StatelessWidget {
  /*  final List<User> userData = [
    User(name: "Haile", age: 12),
  ];
 */
  final user = User(name: "Haile", age: 15);
  dynamic collection;
  List<dynamic> data = [];

  mongotest({super.key});
  void contest() async {
    final result = await connection.userCollection;
    if (result != null) {
      print("Successfully connected to MongoDB!");
    } else {
      print("Faild to connect to Mongo db.");
    }
  }

// Inserting a user into the database

  void inser() async {
    collection = await connection.userCollection;
    await collection.insert(user.toJson());
  }

// Dissplaying all the documents

  void dissplayall(data) async {
    final data = await collection.find().toList();
  }

  @override
  Widget build(BuildContext context) {
    connection.connect();

    return Scaffold(
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              contest();
              // inser();
              // dissplayall(data);
            },
            child: const Text(
                "Click"), /* ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final document = data[index];
                  return ListTile(
                    title: Text(document['name']),
                    subtitle: Text(document['email']),
                  );
                },
              ) */
          ),
        ],
      ),
    );
  }
}
