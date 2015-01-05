import 'package:unittest/unittest.dart';

void main() {
  group('Juggler sequence', () {

      test('for numbers less than 1', () {
          Juggler juggler = new Juggler();
          List<int> sequence = juggler.sequence(0);
          expect([], sequence);
      });

  });
}

class Juggler {
    List<int> sequence(int N) {
        return [];
    }
}

