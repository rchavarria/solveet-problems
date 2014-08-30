import "dart:io";

void main() {
  NumberFilter filter = new NumberFilter();

  // edge cases
  assertListsAreEqual(filter.filterNumbers([9]), [], "Numbers less than 10 are not allowed");
  assertListsAreEqual(filter.filterNumbers([100]), [], "Numbers greater than or equal to 100 are not allowed");
  assertListsAreEqual(filter.filterNumbers([127]), [], "Numbers greater than or equal to 100 are not allowed, even if all digits sum 10");
  assertListsAreEqual(filter.filterNumbers([128]), [], "Numbers greater than or equal to 100 are not allowed, even if units and tenths sum 10");

  assertListsAreEqual(filter.filterNumbers([]), [], "Filter an empty List must return an empty List");
  assertListsAreEqual(filter.filterNumbers([10]), [], "If all numbers whose digits don't sum 10, it must return empty list");
  assertListsAreEqual(filter.filterNumbers([10, 20, 30]), [], "If all numbers whose digits don't sum 10, it must return empty list");
  assertListsAreEqual(filter.filterNumbers([64]), [64], "If a number digits sums 10, it must be present in the returned array");
  assertListsAreEqual(filter.filterNumbers([19, 28, 37]), [19, 28, 37], "It must return all numbers whose digits sum 10");

  assertListsAreEqual(filter.filterNumbers([10, 19, 20, 28, 30, 37]), [19, 28, 37], "It must return all numbers whose digits sum 10");
  
  stdout.writeln("Ok!");
}

void assertTrue(condition, msg) {
  if (!condition) {
    throw new Exception(msg);
  }
}

void assertListsAreEqual(expected, actual, msg) {
  if (expected.length != actual.length) {
    throw new Exception(msg);
  }
  
  for (int i = 0; i < expected.length; i++) {
    assertTrue(expected[i] == actual[i], msg);
  }
}

class NumberFilter {
  
  bool allowed(number) {
    return number >= 10 && number < 100;
  }
  
  bool digitsSumTen(number) {    
    int units = number % 10;
    int tenths = (number ~/ 10) % 10;
    
    return (units + tenths) == 10;
  }

  List filterNumbers(numbers) {
    List filtered = [];
    
    for (int i = 0; i < numbers.length; i++) {
      int actual = numbers[i];
      if (allowed(actual) && digitsSumTen(actual)) {
        filtered.add(actual);
      }
    }

    return filtered;
  }

}
