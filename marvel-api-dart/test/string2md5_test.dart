import 'package:unittest/unittest.dart';
import 'package:cipher/cipher.dart';
import 'package:cipher/impl/server.dart';
import 'dart:typed_data';
import 'dart:convert';

import '../bin/string2md5.dart';

void main() {

    group('MD5 Spike:', () {

        test('calculates a MD5 digest with `cipher` package', () {
            initCipher();

            String inputString = 'compute md5 of this';
            Utf8Encoder encoder = new Utf8Encoder();
            List<int> utf8Data = encoder.convert(inputString);
            Utf8List inputData = new Uint8List.fromList(utf8Data);

            // Example from: https://github.com/izaera/cipher/wiki/Using-digests
            Digest digest = new Digest('MD5');
            Uint8List digestValue = digest.process(inputData);
            // convert List<int> into a string representation of hexadecimal
            // values (this is how MD5 digests are usually represented)
            List<String> output = digestValue.map((i) {
               return i.toRadixString(16).padLeft(2, '0');
            });
            print('Digest value is: ${output}');
        });

    });

    group('Utf8String2MD5', () {

        group('#digest', () {

            test('returns a 32-char-length String', () {
                var md5 = new Utf8String2MD5();
                var md5Result = md5.digest('something');
                expect(md5Result.length, 32);
            });

            test('computes the MD5 of a String', () {
                var md5 = new Utf8String2MD5();
                var md5Result = md5.digest('compute md5 of this');
                expect(md5Result, '3938ec6a9dd52a066e79d93bfdd7e498');
            });

        });

    });
}

