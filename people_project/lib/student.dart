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
    var parts = textData.split('/');
    if (parts.length < 3) throw Exception("data is not enough");
    try {
      name = parts[0].trim();
      age = int.parse(parts[1]);
      score = double.parse(parts[2]);
    } catch (e) {
      throw Exception("Invalid age or score>$e");
    }
  }
}
