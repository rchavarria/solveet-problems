import 'package:cipher/cipher.dart';
import 'package:cipher/impl/server.dart';
import 'dart:typed_data';
import 'dart:convert';

class Utf8String2MD5 {

    Utf8Encoder encoder;
    Digest md5Digest;

    Utf8String2MD5() {
        initCipher();

        encoder = new Utf8Encoder();
        md5Digest = new Digest('MD5');
    }

    String digest(String message) {
        List<int> utf8Data = encoder.convert(message);
        Utf8List inputData = new Uint8List.fromList(utf8Data);
        Uint8List digestValue = md5Digest.process(inputData);

        return digestValue
            .map((i) => i.toRadixString(16)) // converts to hexadecimal string
            .map((s) => s.padLeft(2, '0')) // pad strings with 0
            .join(); // join all elements in the List to build a String
    }

}

