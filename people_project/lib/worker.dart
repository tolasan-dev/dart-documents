import 'package:people_file/person.dart';

class Worker extends Person {
  String factory;
  Worker([super.name = "", super.age = 0, this.factory = ""]);

  @override
  String get info => '${super.info}, factory:$factory';
  @override
  PersonType get type => PersonType.worker;
  @override
  Person clone() => Worker(name, age, factory);
  @override
  String getTextData() => '${super.getTextData()}/$factory';

  @override
  void setTextData(String textData) {
    if (textData.isEmpty) throw Exception('data is empty');
    var parts = textData.split('/');
    if (parts.length < 3) throw Exception("data is not enough");
    try {
      int a = int.parse(parts[1]);
      name = parts[0].trim();
      age = a;
      factory = parts[2].trim();
    } catch (e) {
      throw Exception("Invalid age>$e");
    }
  }
}
