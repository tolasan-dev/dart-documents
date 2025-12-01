import 'dart:convert';
import 'package:students_system/models/student.dart';
import 'package:students_system/utlis/file_helper.dart';

class StudentManager {
  final String filePath = 'data/students.json';
  List<Student> students = [];

  // Load students from file
  Future<void> load() async {
    final file = await FileHelper.getFile(filePath);
    final content = await file.readAsString();

    List data = jsonDecode(content);
    students = data.map((item) => Student.fromJson(item)).toList();
  }

  // Save students to file
  Future<void> save() async {
    final file = await FileHelper.getFile(filePath);
    final jsonData = students.map((s) => s.toJson()).toList();
    await file.writeAsString(jsonEncode(jsonData));
  }

  // Add student
  void addStudent(Student s) {
    students.add(s);
    print("Student added successfully!\n");
  }

  // Update student
  void updateStudent(int id, String newName, int newAge) {
    final student = students.firstWhere(
      (s) => s.id == id,
      orElse: () => throw "Student not found",
    );

    student.name = newName;
    student.age = newAge;

    print("Student updated successfully!\n");
  }

  // Delete student
  void deleteStudent(int id) {
    students.removeWhere((s) => s.id == id);
    print("Student deleted successfully!\n");
  }

  // Show all students
  void listStudents() {
    if (students.isEmpty) {
      print("No students found.\n");
      return;
    }

    print("\n----- Student List -----");
    for (var s in students) {
      print("ID: ${s.id} | Name: ${s.name} | Age: ${s.age}");
    }
    print("------------------------\n");
  }
}
