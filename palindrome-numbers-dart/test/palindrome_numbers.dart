import 'package:unittest/unittest.dart';

void main() {

    group('Hooks', () {

        test('hooks up test', () {
            expect(2, equals(3 - 1));
        });

    });

    group('Reverse', () {

        test('reverses digits', () {
            expect(reverse(11), equals(11));
            expect(reverse(203), equals(302));
            expect(reverse(1234), equals(4321));
        });

    });
    
}

int reverse(int n) => int.parse(n.toString().split('').reversed.join());
