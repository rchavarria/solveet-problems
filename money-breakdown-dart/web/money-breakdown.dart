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
  
  test('5€ breaks down as a 1 bill of 5€', () {
    expect(breakdown(5), equals('1 bill of 5€'));
  });

}

String breakdown(int amount) {
  List values = [5, 2, 1];
  List results = [];
  
  values.forEach((value) {
    if (amount >= value) {
      String coinOrBill = (value > 2) ? 'bill' : 'coin';
      results.add('1 ' + coinOrBill + ' of ' + value.toString() + '€');
      amount -= value;
    }
  });
  
  return results.join(', ');
}
