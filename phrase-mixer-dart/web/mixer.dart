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
    
    test('Mixes two chars from first, one char from last', () {
      String mixed = mix('mi', 'x');
      expect(mixed, equals('mix'));
    });
    
    test('Mixes more than 2 chars from first', () {
      String mixed = mix('mixe', 'd ');
      expect(mixed, equals('mid xe'));
    });
    
    test('Mixes more than 2 chars from last', () {
      String mixed = mix('mi', 'xed ');
      expect(mixed, equals('mixed '));
    });
    
    test('Mixes 3 and 3', () {
      String mixed = mix('mixed', 'mixed');
      expect(mixed, equals('mimixexedd'));
    });
    
    test('Mixes 5 and 5', () {
      String mixed = mix('12345', '54321');
      expect(mixed, equals('1254343251'));
    });

  });
}

String mix(String first, String second) {
  if (first.isEmpty) {
    return second;
  }

  int maxLength = min(2, first.length);
  return first.substring(0, maxLength) + mix(second, first.substring(maxLength));
}

