import 'dart:convert';
import 'dart:io';

abstract class JsonSerializable {
  Map<String, dynamic> toJson();
}

class JsonHelper {
  /// Write a single object to a JSON file.
  static void writeJsonToFile<T extends JsonSerializable>(String path, T obj) {
    final file = File(path);
    Map<String, dynamic> data = obj.toJson();
    // Convert Map to JSON string (pretty printed)
    final jsonString = const JsonEncoder.withIndent('  ').convert(data);

    file.writeAsStringSync(jsonString);
  }

  /// Write a list of objects to a JSON file.
  static void writeJsonListToFile<T extends JsonSerializable>(
    String path,
    List<T> objs,
  ) {
    final file = File(path);

    final jsonString = const JsonEncoder.withIndent(
      '  ',
    ).convert(objs.map((obj) => obj.toJson()).toList());

    file.writeAsStringSync(jsonString);
  }

  /// Read a single object from a JSON file.
  static T readObjectFromFile<T>(
    String path,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    final file = File(path);
    if (!file.existsSync()) {
      throw Exception("File not found: $path");
    }
    final contents = file.readAsStringSync();
    final Map<String, dynamic> jsonMap = jsonDecode(contents);
    return fromJson(jsonMap);
  }

  /// Read a list of objects from a JSON file.
  static List<T> readObjectListFromFile<T extends JsonSerializable>(
    String path,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    final file = File(path);
    if (!file.existsSync()) {
      throw Exception("File not found: $path");
    }

    final contents = file.readAsStringSync();
    final List<dynamic> jsonList = jsonDecode(contents);
    return jsonList.map((json) => fromJson(json)).toList();
  }
}
