import "dart:io";

void main() {
  assertFalse(digitsSumTen(9), "Numbers below 10 are not allowed");
  assertFalse(digitsSumTen(101), "Numbers greater than or equal to 100 are not allowed");
  assertFalse(digitsSumTen(127), "Numbers greater than or equal to 100 are not allowed");
  
  assertTrue(digitsSumTen(64), "64 digits sums 10");
  assertFalse(digitsSumTen(10), "10 digits doesn't sum 10");
  
  assertListsAreEqual(filterNumbers([]), [], "Filter an empty List must return an empty List");
  assertListsAreEqual(filterNumbers([10]), [], "If all numbers whose digits don't sum 10, it must return empty list");
  assertListsAreEqual(filterNumbers([10, 20, 30]), [], "If all numbers whose digits don't sum 10, it must return empty list");
  
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

void assertListsAreEqual(expected, actual, msg) {
  if (expected.length != actual.length) {
    throw new Exception(msg);
  }
  
  for (int i = 0; i < expected.length; i++) {
    assertTrue(expected[i] == actual[i], msg);
  }
}

bool digitsSumTen(number) {
  int units = number % 10;
  int tenths = (number ~/ 10) % 10;
  
  return (units + tenths) == 10;
}

List filterNumbers(unfilteredNumbers) {
  return [];  
}
