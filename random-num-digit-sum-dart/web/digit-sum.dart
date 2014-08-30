import "dart:io";

void main() {
  assertFalse(digitsSumTen(9), "Numbers below 10 are not allowed");
  assertFalse(digitsSumTen(101), "Numbers greater than or equal to 100 are not allowed");
  assertFalse(digitsSumTen(127), "Numbers greater than or equal to 100 are not allowed");
  
  assertTrue(digitsSumTen(64), "64 digits sums 10");
  assertFalse(digitsSumTen(10), "10 digits doesn't sum 10");
  
  stdout.writeln("Ok!");
}

void assertTrue(condition, msg) {
  if (!condition) {
    throw new Exception(msg);
  }
}

void assertFalse(condition, msg) {
  assertTrue(!condition, msg);
}

bool digitsSumTen(number) {
  int units = number % 10;
  int tenths = (number ~/ 10) % 10;
  
  return (units + tenths) == 10;
}