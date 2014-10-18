import 'package:unittest/unittest.dart';

void main() {
  group('Phrase mixer', () {
    
    test('Mixes the two first characters of the first phrase', () {
      String mixed = mix('mi', '');
      expect(mixed, equals('mi'));
    });

  });
}

