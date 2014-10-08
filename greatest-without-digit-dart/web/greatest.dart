import 'package:unittest/unittest.dart';

void main() {
  group('Greatest Z less than X without digit Y', () {

    group('Numbers less than 10', () {

      test('0 is less than 1 without 1', () {
        int z = lessThan(1, 1);
        expect(0, equals(z));
      }

    }
  });
}

