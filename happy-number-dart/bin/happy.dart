import 'package:unittest/unittest.dart';
import 'dart:math';

void main() {
    group('Happy numbers', () {

        group('#digits', () {

            test('splits a number below 10 in an list with one element', () {
                HappyNumbers happy = new HappyNumbers();
                expect(1, happy.digits(1).length);
            });
        });

    });
}

