import 'package:unittest/unittest.dart';
import '../bin/palindrome_numbers.dart';

void main() {

    group('Reverse', () {

        test('reverses digits', () {
            expect(new Palindrome(11).reverse(11), equals(11));
            expect(new Palindrome(203).reverse(203), equals(302));
            expect(new Palindrome(1234).reverse(1234), equals(4321));
        });

    });

    group('Palindrome', () {

        test('detects palindrome numbers', () {
            expect(new Palindrome(12321).isPalindrome(12321), isTrue);
        });

        test('detects non palindrome numbers', () {
            expect(new Palindrome(123).isPalindrome(123), isFalse);
        });

    });

    group('PalindromeSum', () {

        test('sum is not a palindrome number in the first iteration', () {
            expect(new Palindrome(48).isSumPalindrome(48), isFalse);
        });

        test('sum is a palindrome number', () {
            expect(new Palindrome(102).isSumPalindrome(102), isTrue);
        });

        test('sum is a palindrome number in the recursive solution', () {
            expect(new Palindrome(48).sumIsPalindromeRecursively(48), isTrue);
        });

    });

}

