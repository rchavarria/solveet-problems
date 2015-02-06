
class Palindrome {
    int number;

    Palindrome(this.number);

    int reverse(int n) => int.parse(n.toString().split('').reversed.join());

    boolean isPalindrome(int n) => n.toString() == reverse(n).toString();

    boolean isSumPalindrome(int n) => isPalindrome(n + reverse(n));

    boolean sumIsPalindromeRecursively(int n) {
        if (isSumPalindrome(n)) {
            return true;
        }

        int sum = n + reverse(n);
        return sumIsPalindromeRecursively(sum);
    }

}

