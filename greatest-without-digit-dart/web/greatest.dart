import 'package:unittest/unittest.dart';

void main() {
  group('Greatest Z less than X without digit Y', () {

    test('0 is less than 9 without 1', () {
      int z = lessThan(9, 1);
      expect(0, equals(z));
    });

    test('1 is less than 9 without 2', () {
      int z = lessThan(9, 2);
      expect(1, equals(z));
    });

    test('9 is less than 10 without 0', () {
      int z = lessThan(10, 0);
      expect(9, equals(z));
    });

  });
}

int lessThan(x, y) {
  int z = y - 1; 

  if (z < 0) {
    z += 10;
  }

  return z;
}

