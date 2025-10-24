enum PersonType { person, student, worker }

class Person {
  String name;
  int age;
  Person([this.name = '', this.age = 0]);

  PersonType get type => PersonType.person;
  String get info => 'name:$name, age:$age';
  @override
  String toString() => info;

  Person clone() => Person(name, age);
  String getTextData() => '$name/$age';

  void setTextData(String textData) {
    if (textData.isEmpty) throw Exception('data is empty');
    var parts = textData.split('/');
    if (parts.length < 2) throw Exception("data is not enough");
    try {
      int a = int.parse(parts[1]);
      name = parts[0].trim();
      age = a;
    } catch (e) {
      throw Exception("Invalid age>$e");
    }
  }
}
