import 'package:unittest/unittest.dart';

main() {
  
  test('1€ breaks down as a 1 coin of 1€', () {
    expect(breakdown(1), equals('1 coin of 1€'));
  });
  
  test('2€ breaks down as a 1 coin of 2€', () {
    expect(breakdown(2), equals('1 coin of 2€'));
  });
  
  test('3€ breaks down as a 1 coin of 2€, 1 coin of 1€', () {
    expect(breakdown(3), equals('1 coin of 2€, 1 coin of 1€'));
  });
  
  test('4€ breaks down as a 2 coins of 2€', () {
    expect(breakdown(4), equals('2 coins of 2€'));
  });
  
  test('5€ breaks down as a 1 bill of 5€', () {
    expect(breakdown(5), equals('1 bill of 5€'));
  });
  
  test('10€ breaks down as a 1 bill of 10€', () {
    expect(breakdown(10), equals('1 bill of 10€'));
  });

}

class Money {
  String type;
  int value;
  Money(this.type, this.value);
}

String breakdown(int amount) {
  List moneys = [
                 new Money('bill', 10),
                 new Money('bill', 5),
                 new Money('coin', 2),
                 new Money('coin', 1)
                 ];

  List results = [];
  moneys.forEach((money) {
    var value = money.value;
    
    int quantity = 0;
    while (amount >= value) {
      quantity++;
      amount -= value;
    }

    if (quantity > 0) {
      results.add(formatResult(money, quantity));
    }
  });
  
  return results.join(', ');
}

String formatResult(money, quantity) {
  String plural = '';
  if (quantity > 1) {
    plural = 's';
  }
  
  return quantity.toString() + ' ' + money.type + plural + ' of ' + money.value.toString() + '€';
}

