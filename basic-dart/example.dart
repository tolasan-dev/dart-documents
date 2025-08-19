import 'dart:io';

void main() {
  var data = "(2.5, 3.2);(4.2,5.5);(3.6, 5.1)";
  print("reading form file into stdin");
  var recData = data.split(";");
  double total = 0.0;
  String info = "";
  for (var rec in recData) {
    rec = rec.replaceAll("(", "").replaceAll(")", "");
    //print(rec);
    var splits = rec.split(",");
    if (splits.length < 2) continue;
    var wd = double.parse(splits[0]);
    var lng = double.parse(splits[1]);
    var area = wd * lng;
    total += area;
    if (info != "") info += "\n";
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
