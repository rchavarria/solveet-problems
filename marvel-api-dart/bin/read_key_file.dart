import 'dart:convert';
import 'dart:io';
import 'dart:async';

class KeyFileReader {

    String keyFilePath;
    String privateKey;
    String publicKey;

    KeyFileReader(this.keyFilePath);

    void read() {
        File f = new File(keyFilePath);
        var lines = f.readAsLinesSync();
        lines.forEach((line) {
            var keyAndValue = line.split('=');
            if (keyAndValue.length != 2) {
                return;
            }

            var key = keyAndValue[0];
            var value = keyAndValue[1];

            if (key == 'privateKey') {
                privateKey = value;
            } else if (key == 'publicKey') {
                publicKey = value;
            }
        });
    }

}
