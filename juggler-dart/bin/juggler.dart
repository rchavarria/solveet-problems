import 'package:unittest/unittest.dart';
import 'dart:math';

void main() {
  group('Juggler sequence', () {

      test('is empty  for numbers less than 1', () {
          Juggler juggler = new Juggler();
          List<int> sequence = juggler.sequence(0);
          expect([], sequence);
      });

      test('returns N as the first number in it', () {
          Juggler juggler = new Juggler();

          expect(1, juggler.sequence(1)[0]);
          expect(2, juggler.sequence(2)[0]);
          expect(5, juggler.sequence(5)[0]);
      });

      test('returns N square root as second number if N is even', () {
          Juggler juggler = new Juggler();
          expect(4, juggler.sequence(16)[1]);
      });
  });
}

class Juggler {
    List<int> sequence(int N) {
        if (N < 1) {
            return [];
        }

        int squareRoot = sqrt(N).floor();
        return [N, squareRoot];
    }
}

