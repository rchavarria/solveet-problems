import 'package:unittest/unittest.dart';

void main() {
  group('Greatest Z less than X without digit Y', () {
    test('0 is less than 1 without 1', () {
      int z = lessThan(1, 1);
      expect(0, equals(z));
    });
  });
}

int lessThan(x, y) {
  return 0;
}

