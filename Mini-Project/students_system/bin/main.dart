import 'dart:io';
import 'package:student_manager/models/student.dart';
import 'package:student_manager/services/student_manager.dart';
void main() async {
  final manager = StudentManager();
  await manager.load();

  while (true) {
    print("===== Student Manager =====");
    print("1. Add Student");
    print("2. View Students");
    print("3. Update Student");
    print("4. Delete Student");
    print("5. Save & Exit");
    stdout.write("Choose option: ");

    final choice = stdin.readLineSync();

    switch (choice) {
      case "1":
        stdout.write("Enter ID: ");
        int id = int.parse(stdin.readLineSync()!);

        stdout.write("Enter Name: ");
        String name = stdin.readLineSync()!;

        stdout.write("Enter Age: ");
        int age = int.parse(stdin.readLineSync()!);

        manager.addStudent(Student(id: id, name: name, age: age));
        break;

      case "2":
        manager.listStudents();
        break;

      case "3":
        stdout.write("Enter Student ID to update: ");
        int id = int.parse(stdin.readLineSync()!);

        stdout.write("New Name: ");
        String name = stdin.readLineSync()!;

        stdout.write("New Age: ");
        int age = int.parse(stdin.readLineSync()!);

        manager.updateStudent(id, name, age);
        break;

      case "4":
        stdout.write("Enter Student ID to delete: ");
        int id = int.parse(stdin.readLineSync()!);

        manager.deleteStudent(id);
        break;

      case "5":
        await manager.save();
        print("\nData saved. Goodbye!");
        return;

      default:
        print("Invalid option!\n");
    }
  }
}
