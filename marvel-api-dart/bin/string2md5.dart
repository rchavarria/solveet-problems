// set `cipher` as a project's dependency
import 'package:cipher/cipher.dart';
import 'package:cipher/impl/server.dart';
import 'dart:typed_data';
import 'dart:convert';

/**
 * Uses cipher package to compute the MD5 hash of a given String
 */
class Utf8String2MD5 {

    Utf8Encoder encoder;
    Digest md5;

    Utf8String2MD5() {
        // cipher must be initialized before using any class from the package
        initCipher();

        // cipher class to compute the MD5
        md5 = new Digest('MD5');
        encoder = new Utf8Encoder();
    }

    /**
     * @param message Message which MD5 hash will be computed
     * @return the MD5 hash of `message`
     */
    String digest(String message) {
        // get utf-8 values of the message
        List<int> utf8Data = encoder.convert(message);
        // convert to the input data for the cipher class
        Utf8List inputData = new Uint8List.fromList(utf8Data);
        // compute the MD5
        Uint8List digestValue = md5.process(inputData);

        return digestValue
            .map((i) => i.toRadixString(16)) // converts to hexadecimal string
            .map((s) => s.padLeft(2, '0')) // pad strings with 0
            .join(); // join all elements in the List to build a String
    }

}

