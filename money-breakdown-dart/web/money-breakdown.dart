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
  if (amount == 2) {
    return '1 coin of 2€';
  }
  return '1 coin of 1€';
}

