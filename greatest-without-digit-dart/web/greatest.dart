import 'package:unittest/unittest.dart';

void main() {
  group('Greatest Z less than X without digit Y:', () {

    group('for numbers less than 10,', () {

      test('0 is less than 1 without 1', () {
        int z = lessThan(1, 1);
        expect(z, equals(0));
      });

      test('1 is less than 2 without 2', () {
        int z = lessThan(2, 2);
        expect(z, equals(1));
      });

      test('0 is less than 2 without 1', () {
        int z = lessThan(2, 1);
        expect(z, equals(0));
      });

      test('2 is less than 3 without 1', () {
        int z = lessThan(3, 1);
	expect(z, equals(2));
      });

      test('9 is less than 11 without 1', () {
        int z = lessThan(11, 1);
	expect(z, equals(9));
      });

      test('19 is less than 29 without 2', () {
        int z = lessThan(29, 2);
	expect(z, equals(19));
      });

      test('26 is less than 28 without 7', () {
        int z = lessThan(28, 7);
	expect(z, equals(26));
      });

      test('467 is less than 469 without 8', () {
        int z = lessThan(469, 8);
	expect(z, equals(467));
      });

      test('459 is less than 469 without 6', () {
        int z = lessThan(469, 6);
	expect(z, equals(459));
      });

      test('399 is less than 469 without 4', () {
        int z = lessThan(469, 4);
	expect(z, equals(399));
      });

    });

  });
}

int lessThan(x, y) {
  int z = x - 1;

  if (containsDigit(z, y)) {
    return lessThan(z, y);
  }

  return z;
}

bool containsDigit(z, y) {
  if (z == 0) {
    return false;
  }

  int modulus = z % 10;
  int divisor = (z / 10).floor();

  return (modulus == y) || containsDigit(divisor, y);
}

