void main() {
    [1, 2, 10, 15, 123, 321, 1234, 7890]
        .forEach((number) {
            var equilibrated = getEquilibratedNumber(number);
            print('${number} + <mirrored>: ${equilibrated}');
        });
}

int getEquilibratedNumber(int number) => number + reverseNumber(number);

int reverseNumber(int number) {
    var digits = number.toString().split('');
    return int.parse(digits.reversed.join());
}

