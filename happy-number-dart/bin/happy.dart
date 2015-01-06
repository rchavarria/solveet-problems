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
            });
        });

    });
}

class HappyNumbers {
    List<int> digits(number) {
        if (number > 9) {
            return [number, number];
        }

        return [number];
    }
}
