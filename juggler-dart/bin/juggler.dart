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

      test('returns the floor of N^3/2 when it is not an integer', () {
          expect(96, juggler.sequence(21)[1]);
      });

      test('has more than 2 elements for numbers greater than 2', () {
          expect(true, juggler.sequence(3).length > 2);
          expect(true, juggler.sequence(4).length > 2);
      });

      test('concrete examples', () {
          expect([3, 5, 11, 36, 6, 2, 1], juggler.sequence(3));
          expect([4, 2, 1], juggler.sequence(4));
          expect([5, 11, 36, 6, 2, 1], juggler.sequence(5));
          expect([6, 2, 1], juggler.sequence(6));
          expect([7, 18, 4, 2, 1], juggler.sequence(7));
          expect([8, 2, 1], juggler.sequence(8));
          expect([9, 27, 140, 11, 36, 6, 2, 1], juggler.sequence(9));
      });

    });

    group('Juggler results', () {

      test('from 1 to 100', () {
          Juggler juggler = new Juggler();
          for (int i = 1; i <= 100; i++) {
              var seq = juggler.sequence(i);
              print('N=${i}, Length=${seq.length}, Max=${seq.reduce(max)}, Seq=${seq}');
          }
      });

    });
}

class Juggler {
    List<int> sequence(int N) {
        if (N < 1) {
            return [];
        }

        List<int> result = [N];
        if (N == 1) {
            return result;
        }

        result.addAll(sequence(next(N)));
        return result;
    }

    int next(int N) {
        int squareRoot = sqrt(N).floor();
        int threeHalvesRoot = pow(N, 3/2).floor();

        return (N % 2 == 0) ? squareRoot : threeHalvesRoot;
    }
}

