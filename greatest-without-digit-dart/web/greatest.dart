import 'package:unittest/unittest.dart';

void main() {
  group('Greatest Z less than X without digit Y:', () {

    group('for numbers less than 10,', () {

      test('0 is less than 1 without 1', () {
        int z = lessThan(1, 1);
        expect(0, equals(z));
      });

      test('1 is less than 2 without 2', () {
        int z = lessThan(2, 2);
        expect(1, equals(z));
      });

      test('0 is less than 2 without 1', () {
        int z = lessThan(2, 1);
        expect(0, equals(z));
      });

      test('2 is less than 3 without 1', () {
        int z = lessThan(3, 1);
	expect(2, equals(z));
      });

      test('9 is less than 11 without 1', () {
        int z = lessThan(11, 1);
	expect(9, equals(z));
      });

    });

  });
}

int lessThan(x, y) {
  int z = x - 1;

  if (z == y) {
    return lessThan(z, y);
  }

  return z;
}

