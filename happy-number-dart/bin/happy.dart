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

            test('splits a number between 10 and 99 in a list with two elements', () {
                expect(2, happy.digits(10).length);
                expect(2, happy.digits(35).length);
                expect(2, happy.digits(99).length);
            });

            test('returns tenths and units in a number so that 9 < x < 99', () {
                expect([1, 0], happy.digits(10));
                expect([3, 5], happy.digits(35));
                expect([9, 9], happy.digits(99));
            });

            test('splits numbers with all its digits', () {
                expect([1, 0, 0], happy.digits(100));
                expect([2, 5, 7], happy.digits(257));
                expect([1, 2, 3, 4, 5], happy.digits(12345));
            });

        });

    });
}

class HappyNumbers {
    List<int> digits(number) {
        if (number > 9) {
            return [number ~/ 10, number % 10];
        }

        return [number];
    }
}
