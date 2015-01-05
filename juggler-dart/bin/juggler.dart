import 'package:unittest/unittest.dart';

void main() {
  group('Juggler sequence', () {

      test('is empty  for numbers less than 1', () {
          Juggler juggler = new Juggler();
          List<int> sequence = juggler.sequence(0);
          expect([], sequence);
      });

      test('is 1 for number 1', () {
          Juggler juggler = new Juggler();
          List<int> sequence = juggler.sequence(1);
          expect([1], sequence);
      });

  });
}

class Juggler {
    List<int> sequence(int N) {
        return [];
    }
}

