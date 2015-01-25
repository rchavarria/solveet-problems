void main() {
    print('Start');
    var number = 123;
    var strNumber = number.toString();
    print('strNumber: ${strNumber}');
    var digits = strNumber.split('');
    print('digits: ${digits}');
    var reversed = [];
    digits.forEach((d) => reversed.insert(0, d));
    print('reversed: ${reversed}');
    var strReversed = reversed.join();
    print ('strReversed: ${strReversed}');
    var intReversed = int.parse(strReversed);
    print ('intReversed: ${intReversed}');
    
    print('sum: ${number + intReversed}');
}
