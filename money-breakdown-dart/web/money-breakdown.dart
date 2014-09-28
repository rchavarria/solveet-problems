import 'package:unittest/unittest.dart';

main() {
  
  test('1€ breaks down as a 1 coin of 1€', () {
    expect(breakdown(1), equals('1 coin of 1€'));
  });

}
