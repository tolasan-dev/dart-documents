import 'package:people_file/person.dart';

class Student extends Person {
  double score;
  Student([super.name = '', super.age = 0, this.score = 0.0]);

  @override
  String get info => '${super.info}, score:$score';
  @override
  PersonType get type => PersonType.student;
  @override
  Person clone() => Student(name, age, score);
  @override
  String getTextData() => '${super.getTextData()}/$score';

  @override
  void setTextData(String textData) {
    if (textData.isEmpty) throw Exception('data is empty');
    var parts = textData.split('/');
    if (parts.length < 3) throw Exception("data is not enough");
    try {
      int a = int.parse(parts[1]);
      double s = double.parse(parts[2]);
      name = parts[0].trim();
      age = a;
      score = s;
    } catch (e) {
      throw Exception("Invalid age or score>$e");
    }
  }
}
