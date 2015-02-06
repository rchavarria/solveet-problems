
class Palindrome {
    int number;
    int maxIterations;

    Palindrome(this.number, {this.maxIterations: 1});

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

