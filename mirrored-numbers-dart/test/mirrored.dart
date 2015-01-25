void main() {
    print('Start');
    var number = 123;
    var intReversed = reverseNumber(number);
    
    print('sum: ${number + intReversed}');
}

int reverseNumber(int number) {
    var strNumber = number.toString();
    var digits = strNumber.split('');
    var reversed = [];
    digits.forEach((d) => reversed.insert(0, d));
    var strReversed = reversed.join();
    return int.parse(strReversed);
}
