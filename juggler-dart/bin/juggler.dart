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

      test('returns the floor of N square root when it is not an integer', () {
          expect(2, juggler.sequence(6)[1]);
      });

      test('returns N^3/2 as second number if N is odd', () {
          expect(27, juggler.sequence(9)[1]);
      });

  });
}

class Juggler {
    List<int> sequence(int N) {
        if (N < 1) {
            return [];
        }

        int squareRoot = sqrt(N).floor();
        int threeSecondsRoot = pow(N, 3/2);

        if (N % 2 == 0) {
            return [N, squareRoot];
        }
        return [N, threeSecondsRoot];
    }
}

