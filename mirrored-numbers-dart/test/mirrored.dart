void main() {
    print('Start');
    var number = 123;
    var intReversed = reverseNumber(number);
    
    print('sum: ${number + intReversed}');
}

int getEquilibratedNumber(int number) {
    return number + reverseNumber(number);
}

int reverseNumber(int number) {
    var digits = number.toString().split('');
    var reversed = [];
    digits.forEach((d) => reversed.insert(0, d));
    return int.parse(reversed.join());
}
