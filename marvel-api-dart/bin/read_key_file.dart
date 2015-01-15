import 'package:unittest/unittest.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:async';

void main(List<String> arguments) {

    group('ReadKeyFile Spike:', () {

        test('reads a .env file with and sets private key', () {
            var reader = new KeyFileReader('bin/.env_test');
            reader.read();
            expect('private key value', reader.privateKey);
        });

    });

}


class KeyFileReader {

    String keyFilePath;
    String privateKey;

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
            }
        });
    }

}
