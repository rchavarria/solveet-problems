import 'package:unittest/unittest.dart';
import '../bin/palindrome_numbers.dart';

void main() {
    var palindrome = new Palindrome();

    group('Hooks', () {

        test('hooks up test', () {
            expect(2, equals(3 - 1));
        });

    });

    group('Reverse', () {

        test('reverses digits', () {
            expect(palindrome.reverse(11), equals(11));
            expect(palindrome.reverse(203), equals(302));
            expect(palindrome.reverse(1234), equals(4321));
        });

    });

    group('Palindrome', () {

        test('detects palindrome numbers', () {
            expect(palindrome.isPalindrome(12321), isTrue);
        });

        test('detects non palindrome numbers', () {
            expect(palindrome.isPalindrome(123), isFalse);
        });

    });

    group('PalindromeSum', () {

        test('sum is not a palindrome number in the first iteration', () {
            expect(palindrome.isSumPalindrome(48), isFalse);
        });

        test('sum is a palindrome number', () {
            expect(palindrome.isSumPalindrome(102), isTrue);
        });

    });

}

