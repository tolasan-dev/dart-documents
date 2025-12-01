//  create class of Student 

class Student {
  
  int id;
  String name;
  int age;

  Student({

    required this.id,
    required this.name,
    required this.age,

  });

    // Convert Objects json data to student object
    factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'],
      name: json['name'],
      age: json['age'],
    );
  }
 
  // convert object of student to json data or format
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'age': age,
    };
  }
  
}