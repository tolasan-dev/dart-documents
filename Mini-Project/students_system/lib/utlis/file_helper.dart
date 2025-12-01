import 'dart:io';

class FileHelper {
  static Future<File> getFile(String path) async {
    final file = File(path);

    if (!await file.exists()) {
      await file.create(recursive: true);
      await file.writeAsString('[]');
    }

    return file;
  }
}
