import 'package:people_file/person.dart';

class PersonText {
  static List<Person?> objects = [Person()];

  static String toText<T extends Person>(T object) {
    return '${object.type.name}:${object.getTextData()}';
  }

  static Person? toPerson(String textData) {
    if (textData.isEmpty) throw Exception("Data is empty");
    var parts = textData.split(":");
    if (parts.length < 2) throw Exception("Data does not include ':'");
    var name = parts[0].trim().toLowerCase();
    var type = PersonType.values.byName(name);

    var per = objects.firstWhere(
      (obj) => obj?.type == type,
      orElse: () => null,
    );

    if (per != null) {
      try {
        per = per.clone()..setTextData(parts[1]);
      } catch (e) {
        rethrow;
      }
    }
    return per;
  }
}
