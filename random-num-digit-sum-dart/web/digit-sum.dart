import "dart:io";

void main() {
  assertFalse(digitsSumTen(9), "Numbers below 10 are not allowed");
  assertFalse(digitsSumTen(101), "Numbers greater than or equal to 100 are not allowed");
  assertFalse(digitsSumTen(127), "Numbers greater than or equal to 100 are not allowed");
  assertFalse(digitsSumTen(128), "Numbers greater than or equal to 100 are not allowed");
  
  assertTrue(digitsSumTen(64), "64 digits sums 10");
  assertFalse(digitsSumTen(10), "10 digits doesn't sum 10");
  
  assertListsAreEqual(filterNumbers([]), [], "Filter an empty List must return an empty List");
  assertListsAreEqual(filterNumbers([10]), [], "If all numbers whose digits don't sum 10, it must return empty list");
  assertListsAreEqual(filterNumbers([10, 20, 30]), [], "If all numbers whose digits don't sum 10, it must return empty list");
  assertListsAreEqual(filterNumbers([64]), [64], "If a number digits sums 10, it must be present in the returned array");
  assertListsAreEqual(filterNumbers([19, 28, 37]), [19, 28, 37], "It must return all numbers whose digits sum 10");
  assertListsAreEqual(filterNumbers([10, 19, 20, 28, 30, 37]), [19, 28, 37], "It must return all numbers whose digits sum 10");
  
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
  NumberFilter filter = new NumberFilter();
  if (!filter.allowed(number)) {
    return false;
  }
  
  int units = number % 10;
  int tenths = (number ~/ 10) % 10;
  
  return (units + tenths) == 10;
}

List filterNumbers(unfilteredNumbers) {
  List filtered = [];
  
  for (int i = 0; i < unfilteredNumbers.length; i++) {
    int actual = unfilteredNumbers[i];
    if (digitsSumTen(actual)) {
      filtered.add(unfilteredNumbers[i]);
    }
  }

  return filtered;
}

class NumberFilter {
  
  bool allowed(number) {
    return number >= 10 && number < 100;
  }
}
