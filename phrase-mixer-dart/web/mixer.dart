import 'dart:math';
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
    
    test('Mixes two chars from first, two chars from last', () {
      String mixed = mix('mi', 'xe');
      expect(mixed, equals('mixe'));
    });
    
    test('Mixes one char from first, two chars from last', () {
      String mixed = mix('m', 'xe');
      expect(mixed, equals('mxe'));
    });

  });
}

String mix(String first, String second) {
  if (first.isEmpty) {
    return second;
  }

  int maxLength = min(2, first.length);
  return first + mix(second, first.substring(maxLength));
}

