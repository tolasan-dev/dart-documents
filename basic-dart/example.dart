import 'dart:io';
import 'lib/trilib.dart';
 
void main() {
  print("Enter rectangle data in format (w,l);(w,l);... :");
  String? input = stdin.readLineSync();

  if (input == null || input.trim().isEmpty) {
    print("No input provided!");
    return;
  }

  var recData = input.split(";");
  double total = 0.0;
  String info = "";

  for (var rec in recData) {
    rec = rec.replaceAll("(", "").replaceAll(")", "").trim();
    if (rec.isEmpty) continue;

    var splits = rec.split(",");
    if (splits.length < 2) continue;

    var wd = double.tryParse(splits[0].trim()) ?? 0.0;
    var lng = double.tryParse(splits[1].trim()) ?? 0.0;
    var area = wd * lng;
    total += area;

    if (info.isNotEmpty) info += "\n";
    info +=
        "${wd.toStringAsFixed(2).padLeft(8)} ${lng.toStringAsFixed(2).padLeft(8)} ${area.toStringAsFixed(2).padLeft(8)}";
  }

  var heading =
      "${"width".padLeft(8)} ${"length".padLeft(8)} ${"area".padLeft(8)}";
  var totalInfo =
      "${"Total Area:".padLeft(17)} ${total.toStringAsFixed(2).padLeft(8)}";

  print(heading);
  print(info);
  print(totalInfo);
}
