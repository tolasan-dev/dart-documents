import 'dart:io';

import 'package:json_data/json_data.dart';

void main(List<String> arguments) {
  String filename = "users.json";

  print("Writing all users to file, $filename");
  writeUsersToFile(filename);

  print("\nContent of the file, $filename");
  var contents = File(filename).readAsStringSync();
  print(contents);

  print("\nReading all users from the file, $filename");
  readUsersFromFile(filename);
}
