class Asserts {
  
  void isTrue(condition, message) {
    if (!condition) {
      throw new Exception(message);
    }
  }

  void areEqual(expected, actual, {message: 'Expected is not equal to actual'}) {
    if (expected != actual) {
      throw new Exception(message);
    }
  }

  void assertListsAreEqual(expected, actual, message) {
    if (expected.length != actual.length) {
      throw new Exception(message);
    }
    
    for (int i = 0; i < expected.length; i++) {
      isTrue(expected[i] == actual[i], 'On element ${i}: ' + message);
    }
  }

}