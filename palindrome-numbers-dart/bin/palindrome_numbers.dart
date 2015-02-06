
class Palindrome {
    int number;

    Palindrome(this.number);

    int reverse(int n) => int.parse(n.toString().split('').reversed.join());

    boolean isPalindrome(int n) => n.toString() == reverse(n).toString();

    boolean isSumPalindrome() => isPalindrome(number + reverse(number));

    boolean sumIsPalindromeRecursively() {
        number = number + reverse(number);
        if (isPalindrome(number)) {
            return true;
        }

        return sumIsPalindromeRecursively();
    }

}

