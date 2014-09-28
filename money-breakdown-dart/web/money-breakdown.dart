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
  
  test('The rest of exact bills', () {
    expect(breakdown(20), equals('1 bill of 20€'));
    expect(breakdown(50), equals('1 bill of 50€'));
    expect(breakdown(100), equals('1 bill of 100€'));
    expect(breakdown(200), equals('1 bill of 200€'));
    expect(breakdown(500), equals('1 bill of 500€'));
  });

  test('Other edge cases that breaks down with several coins/bills', () {
    expect(breakdown(9), equals('1 bill of 5€, 2 coins of 2€'));
    expect(breakdown(19), equals('1 bill of 10€, 1 bill of 5€, 2 coins of 2€'));
    expect(breakdown(49), equals('2 bills of 20€, 1 bill of 5€, 2 coins of 2€'));
    expect(breakdown(1999), 
           equals('3 bills of 500€, 2 bills of 200€, 1 bill of 50€, 2 bills of 20€, 1 bill of 5€, 2 coins of 2€'));
  });
  
}

class Money {
  String type;
  int value;
  Money(this.type, this.value);
}

String breakdown(int amount) {
  List moneys = [
                 new Money('bill', 500),
                 new Money('bill', 200),
                 new Money('bill', 100),
                 new Money('bill', 50),
                 new Money('bill', 20),
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

