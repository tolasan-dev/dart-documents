import 'package:people_file/people_file.dart';
import 'package:people_file/person.dart';
import 'package:people_file/student.dart';
import 'package:people_file/worker.dart';
import 'package:people_file/person_text.dart';

void main(List<String> arguments) {
  PersonText.objects = [Person(), Student(), Worker()];

  List<Person> source = [
    Person("Leng Nara", 29),
    Student("Chan Mom", 45, 95.5),
    Worker("Chan Keh", 33, "Sun Light Factory"),
    Student("Van Neary", 25, 88.0),
    Person("Vong Sothy", 22),
  ];

  String filename = 'data/people.txt';
  print("Writing people to file...");
  try {
    PeopleFile.writingFile(source, filename);
    print("Successfully written to file, $filename");
  } catch (e) {
    print("Failed to write to file, $filename > $e");
  }

  print("\nReading from file...");
  List<Person> result = [];
  try {
    result = PeopleFile.readingFile(filename);
    print("Successfully read from file, $filename");
  } catch (e) {
    print("Failed to read people from file, $filename");
    return;
  }

  if (result.isNotEmpty) {
    print("\nAll people read from file:");
    result.forEach(print);
  }
}
