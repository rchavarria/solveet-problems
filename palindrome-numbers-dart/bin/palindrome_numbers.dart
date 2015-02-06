
class Palindrome {
    int number;

    Palindrome(this.number);

    int reverse(int n) => int.parse(n.toString().split('').reversed.join());

    boolean isPalindrome(int n) => n.toString() == reverse(n).toString();

    boolean isSumPalindrome() => isPalindrome(number + reverse(number));

    boolean sumIsPalindromeRecursively() {
        int sum = number + reverse(number);
        if (isPalindrome(sum)) {
            return true;
        }

        number = sum;
        return sumIsPalindromeRecursively();
    }

}

