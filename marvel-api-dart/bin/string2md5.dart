import 'package:unittest/unittest.dart';
import 'package:cipher/cipher.dart';
import 'package:cipher/impl/server.dart';
import 'dart:typed_data';
import 'dart:convert';

void main() {

    group('Utf8String2MD5', () {

        test('calculating an MD5 digest with cipher package', () {
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
}
