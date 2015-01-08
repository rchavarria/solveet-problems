import 'package:unittest/unittest.dart';
import 'dart:math';

void main() {
    HappyNumbers happy = new HappyNumbers();

    group('Happy numbers', () {

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

        group('#squareSums', () {

            test('sums the squares of all numbers in an array', () {
                expect(1, happy.squareSums([1]));
                expect(4, happy.squareSums([2]));
                expect(25, happy.squareSums([3, 4]));
                expect(55, happy.squareSums([1, 2, 3, 4, 5]));
            });

        });

        group('#isHappy', () {

            test('returns false if maximum number of configured iterations is reached', () {
                HappyNumbers happy = new HappyNumbers(maximumIterationsAllowed: -1);
                expect(false, happy.isHappy(1));
            });

            test('returns false if maximum number of default iterations (20) is reached', () {
                expect(false, happy.isHappy(2));
            });

            test('returns true for number 1', () {
                expect(true, happy.isHappy(1));
            });

            test('returns true for happy numbers', () {
                expect(true, happy.isHappy(7));
                expect(true, happy.isHappy(10));
                expect(true, happy.isHappy(13));
                expect(true, happy.isHappy(19));
                expect(true, happy.isHappy(23));
                expect(true, happy.isHappy(28));
                expect(true, happy.isHappy(31));
                expect(true, happy.isHappy(32));
                expect(true, happy.isHappy(44));
                expect(true, happy.isHappy(49));
                expect(true, happy.isHappy(68));
                expect(true, happy.isHappy(70));
                expect(true, happy.isHappy(79));
                expect(true, happy.isHappy(82));
                expect(true, happy.isHappy(91));
                expect(true, happy.isHappy(94));
                expect(true, happy.isHappy(97));
                expect(true, happy.isHappy(100));
            });

            test('returns false for sad numbers', () {
                expect(false, happy.isHappy(2));
                expect(false, happy.isHappy(5));
            });

        });

        test('results from 1 to 100', () {
            for(int i = 1; i <= 100; i++) {
                bool isHappy = happy.isHappy(i);
                if (!isHappy) continue;

                print('${i} is happy: ${isHappy}');
            }
        });
    });
}

class HappyNumbers {

    int maximumNumberOfIterations;

    HappyNumbers ({int maximumIterationsAllowed: 20}) {
        maximumNumberOfIterations = maximumIterationsAllowed;
    }

    List<int> digits(number) {
        List<int> allDigits = new List<int>();

        while(number > 0) {
            allDigits.insert(0, number % 10);
            number = number ~/ 10;
        }

        return allDigits;
    }

    int squareSums(digits) {
        return digits
            .map((n) => n * n)
            .reduce((sum, n) => sum + n);
    }

    boolean isHappy(int number, {int iteration: 0}) {
        if (maximumNumberOfIterations < iteration) {
            return false;
        }

        int next = squareSums(digits(number));
        if (next == 1) {
            return true;
        }

        return isHappy(next, iteration: iteration + 1);
    }

}
