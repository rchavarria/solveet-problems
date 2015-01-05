import 'package:unittest/unittest.dart';
import 'dart:math';

void main() {
  group('Juggler sequence', () {

      Juggler juggler = new Juggler();

      test('is empty  for numbers less than 1', () {
          expect([], juggler.sequence(0));
      });

      test('returns N as the first number in it', () {
          expect(1, juggler.sequence(1)[0]);
          expect(2, juggler.sequence(2)[0]);
          expect(5, juggler.sequence(5)[0]);
      });

      test('returns N square root as second number if N is even', () {
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

