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
            expect(new NextLeapYear(1980).next().year, equals(1980));
        });

        test('a no-leap year returns the next year divisible by 4', () {
            expect(new NextLeapYear(1977).next().year, equals(1980));
            expect(new NextLeapYear(1978).next().year, equals(1980));
            expect(new NextLeapYear(1979).next().year, equals(1980));
        });

        test('years divisible by 100 are no leap, so it returns the next leap year', () {
            expect(new NextLeapYear(1900).next().year, equals(1904));
        });

        test('a no-leap year returns the next year divisible by 4, but not by 100', () {
            expect(new NextLeapYear(1897).next().year, equals(1904));
            expect(new NextLeapYear(1898).next().year, equals(1904));
            expect(new NextLeapYear(1899).next().year, equals(1904));
        });

    });

}

