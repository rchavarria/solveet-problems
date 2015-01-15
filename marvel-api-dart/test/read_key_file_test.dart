import 'package:unittest/unittest.dart';
import '../bin/read_key_file.dart';

void main(List<String> arguments) {

    group('KeyFileReader Spike:', () {

        test('reads a .env file with and sets private key', () {
            var reader = new KeyFileReader('bin/.env_test');
            reader.read();
            expect('private key value', reader.privateKey);
        });

        test('reads a .env file with and sets public key', () {
            var reader = new KeyFileReader('bin/.env_test');
            reader.read();
            expect('public key value', reader.publicKey);
        });

    });

}

