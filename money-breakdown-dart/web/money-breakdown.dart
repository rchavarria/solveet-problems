import 'package:unittest/unittest.dart';

main() {
  
  test('1€ breaks down as a 1 coin of 1€', () {
    expect(breakdown(1), equals('1x1€'));
  });
  
  test('2€ breaks down as a 1 coin of 2€', () {
    expect(breakdown(2), equals('1x2€'));
  });
  
  test('3€ breaks down as a 1 coin of 2€, 1 coin of 1€', () {
    expect(breakdown(3), equals('1x2€, 1x1€'));
  });
  
  test('4€ breaks down as 2 coins of 2€', () {
    expect(breakdown(4), equals('2x2€'));
  });
  
  test('5€ breaks down as 1 coin of 5€', () {
    expect(breakdown(5), equals('1x5€'));
  });
  
  test('6 to 9', () {
    expect(breakdown(6), equals('1x5€, 1x1€'));
    expect(breakdown(7), equals('1x5€, 1x2€'));
    expect(breakdown(8), equals('1x5€, 1x2€, 1x1€'));
    expect(breakdown(9), equals('1x5€, 2x2€'));
  });
  
  test('10 to 19', () {
    expect(breakdown(10), equals('1x10€'));
    expect(breakdown(11), equals('1x10€, 1x1€'));
    expect(breakdown(12), equals('1x10€, 1x2€'));
    expect(breakdown(13), equals('1x10€, 1x2€, 1x1€'));
    expect(breakdown(14), equals('1x10€, 2x2€'));
    expect(breakdown(15), equals('1x10€, 1x5€'));
    expect(breakdown(16), equals('1x10€, 1x5€, 1x1€'));
    expect(breakdown(17), equals('1x10€, 1x5€, 1x2€'));
    expect(breakdown(18), equals('1x10€, 1x5€, 1x2€, 1x1€'));
    expect(breakdown(19), equals('1x10€, 1x5€, 2x2€'));
  });
  
  test('others', () {
    expect(breakdown(434), equals('2x200€, 1x20€, 1x10€, 2x2€'));
    expect(breakdown(99), equals('1x50€, 2x20€, 1x5€, 2x2€'));
  });
}

String breakdown(int amount) {
  List coins = [500, 200, 100, 50, 20, 10, 5, 2, 1];
  List results = [];
  
  coins.forEach((coin) {
    int quantity = 0;
    while(amount >= coin) {
      quantity ++;
      amount -= coin;
    }

    if (quantity > 0) {
      results.add(quantity.toString() + 'x' + coin.toString() + '€');
    }
  });
  
  return results.join(', ');
}
