import 'dart:io';
import 'package:people_file/person.dart';
import 'package:people_file/person_text.dart';

class PeopleFile {
  static void writingFile(List<Person> people, String filename) {
    File file = File(filename);
    var contents =
        people.map((per) => PersonText.toText(per)).reduce((a, b) => '$a\n$b');
    file.writeAsStringSync(contents);
  }

  static List<Person> readingFile(String filename) {
    File file = File(filename);
    if (!file.existsSync()) throw Exception("File, $filename, does not exist");
    var lines = file.readAsLinesSync();
    List<Person> people = [];
    for (var line in lines) {
      try {
        var per = PersonText.toPerson(line);
        if (per != null) people.add(per);
      } catch (e) {
        // skip invalid lines or log errors
      }
    }
    return people;
  }
}
