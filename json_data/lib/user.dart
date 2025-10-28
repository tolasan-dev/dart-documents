import 'package:json_data/json_helper.dart';

class User implements JsonSerializable {
  int id;
  String name;

  User(this.id, this.name);
  @override
  Map<String, dynamic> toJson() => {'id': id, 'name': name};

  factory User.fromJson(Map<String, dynamic> data) {
    return User(data['id']!, data['name']!);
  }
}
