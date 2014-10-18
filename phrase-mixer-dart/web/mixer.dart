import 'package:unittest/unittest.dart';

void main() {
  group('Phrase mixer', () {
    
    test('Mixes the two first characters of the first phrase', () {
      String mixed = mix('mi', '');
      expect(mixed, equals('mi'));
    });
    
    test('Mixes the two frist characters of the second phrase', () {
      String mixed = mix('', 'xe');
      expect(mixed, equals('xe'));
    });

  });
}

String mix(String first, String second) {
  return 'mi';
}

