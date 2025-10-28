import 'package:json_data/json_helper.dart';
import 'package:json_data/user.dart';

void writeUsersToFile(String filename) {
  List<User> users = [User(1, 'Alice'), User(2, 'Anna'), User(3, 'Jasmin')];
  try {
    JsonHelper.writeJsonListToFile(filename, users);
    print("Successfully written to file");
  } catch (e) {
    print("Failed in writing to file> $e");
  }
}

void readUsersFromFile(String filename) {
  try {
    var users = JsonHelper.readObjectListFromFile(filename, User.fromJson);
    for (var user in users) {
      print("id:${user.id}\nname:${user.name}\n");
    }
  } catch (e) {
    print("Error>$e");
  }
}
