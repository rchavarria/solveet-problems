import 'package:unittest/unittest.dart';

void main() {
  group('Juggler sequence', () {

      test('is empty  for numbers less than 1', () {
          Juggler juggler = new Juggler();
          List<int> sequence = juggler.sequence(0);
          expect([], sequence);
      });

      test('returns N as the first number in it', () {
          Juggler juggler = new Juggler();

          expect(1, juggler.sequence(1));
          expect(2, juggler.sequence(2));
          expect(5, juggler.sequence(5));
      });

  });
}

class Juggler {
    List<int> sequence(int N) {
        return [];
    }
}

