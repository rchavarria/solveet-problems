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

    });

  });
}

int lessThan(x, y) {
  return y - 1;
}

