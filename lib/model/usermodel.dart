class User {
  String name;
  int age;

  User({required this.name, required this.age});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
    };
  }
}
