import 'package:unittest/unittest.dart';
import 'dart:math';

void main() {
    group('Happy numbers', () {

        HappyNumbers happy = new HappyNumbers();

        group('#digits', () {

            test('splits a number below 10 in an list with one element', () {
                expect(1, happy.digits(1).length);
                expect(1, happy.digits(3).length);
                expect(1, happy.digits(9).length);
            });

            test('returns the same number if it is below 10', () {
                expect([2], happy.digits(2));
            });

        });

    });
}

class HappyNumbers {
    List<int> digits(number) {
        return [number];
    }
}
