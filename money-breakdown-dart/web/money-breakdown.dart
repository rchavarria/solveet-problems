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

}

String breakdown(int amount) {
  List values = [2, 1];
  List results = [];
  
  values.forEach((value) {
    if (amount >= value) {
      results.add('1 coin of ' + value.toString() + '€');
      amount -= value;
    }
  });
  
  return results.join(', ');
}
