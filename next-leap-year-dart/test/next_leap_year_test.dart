import 'package:unittest/unittest.dart';
import '../bin/next_leap_year.dart';

void main() {

    group('Hook up test', () {

        test('hooks up', () {
            expect(2 - 1, equals(1));
        });

    });

    group('NextLeapYear', () {

        test('years divisible by 4 are leap year, so they are returned as they are', () {
            var testLeapYear = new NextLeapYear(1980);
            var next = testLeapYear.next();
            expect(next.year, equals(1980));
        });

        test('a no-leap year returns the next year divisible by 4', () {
            var testLeapYear = new NextLeapYear(1979);
            var next = testLeapYear.next();
            expect(next.year, equals(1980));
        });

    });

}

