import 'dart:math';

int fieldWidth = 8;

//record type with named fields
typedef Triangle = ({double? a, double? b, double? c, String? error});

//function with named parameters
bool isValidSides({double? a, double? b, double? c}) {
  if (a == null || b == null || c == null) return false;
  return !(a + b < c || a + c < b || b + c < a);
}

//function with default parameters
Triangle getTriangle(String data, [String separator = '/']) {
  var parts = data.split(separator);
  if (parts.length < 3)
    return (
      error: "Given data, ${data}, is not enough",
      a: null,
      b: null,
      c: null,
    );
  var sa = double.parse(parts[0]);
  var sb = double.parse(parts[1]);
  var sc = double.parse(parts[2]);
  if (isValidSides(a: sa, b: sb, c: sc) == false)
    return (error: "Invalid sides", a: sa, b: sb, c: sc);
  return (a: sa, b: sb, c: sc, error: null);
}

//function with positional parameter
double? getArea(Triangle triangle) {
  if (triangle.error != null) return null;
  if (!isValidSides(a: triangle.a, b: triangle.b, c: triangle.c)) return null;
  var p = 0.5 * (triangle.a! + triangle.b! + triangle.c!);
  return sqrt(p * (p - triangle.a!) * (p - triangle.b!) * (p - triangle.c!));
}

//function with positional parameters
String getInfo(double a, double b, double c, double area) =>
    "${a.toStringAsFixed(2).padLeft(fieldWidth)} "
    "${b.toStringAsFixed(2).padLeft(fieldWidth)} "
    "${c.toStringAsFixed(2).padLeft(fieldWidth)} "
    "${area.toStringAsFixed(2).padLeft(fieldWidth)}";

//function to get a heading for viewing triangles
String getHeading() =>
    "${"a".padLeft(fieldWidth)} "
    "${"b".padLeft(fieldWidth)} "
    "${"c".padLeft(fieldWidth)} "
    "${"area".padLeft(fieldWidth)}";
