import 'dart:io';
import 'dart:math';

// import 'dart:math';

void main() {
  var rng = Random();
  int randomInt = rng.nextInt(100); 
  double randomDouble = rng.nextDouble(); 
  print("Random int: $randomInt");
  print("Random double: $randomDouble");
}