import 'package:unittest/unittest.dart';
// package http can be used to get remote content from the server
// documentation: https://pub.dartlang.org/packages/http
import 'package:http/http.dart' as http;

import 'read_key_file.dart';

void main() {

    group('HTTP Requests Spike:', () {

        test('http package gets a response from a URL', () {
            String baseEndpoint = 'http://gateway.marvel.com';
            String url = '${baseEndpoint}/v1/public/comics';

            http.get(url)
                .then((response) {
                    print(response.statusCode);
                });
        });

    });

    group('API login Spike:', () {

        test('performs the first request and gets authenticated', () {
            // reading keys
            var reader = new KeyFileReader('.env');
            reader.read();

            print('Private Key: ${reader.privateKey}');
            print('Public Key: ${reader.publicKey}');
        });

    });

}
