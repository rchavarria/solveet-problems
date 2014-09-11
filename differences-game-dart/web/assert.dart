class AssertThat {
  
  void isTrue(condition, message) {
    if (!condition) {
      throw new Exception(message);
    }
  }

  void assertListsAreEqual(expected, actual, message) {
    if (expected.length != actual.length) {
      throw new Exception(message);
    }
    
    for (int i = 0; i < expected.length; i++) {
      isTrue(expected[i] == actual[i], message);
    }
  }

}