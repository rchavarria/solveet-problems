import 'package:unittest/unittest.dart';
// package http can be used to get remote content from the server
// documentation: https://pub.dartlang.org/packages/http
import 'package:http/http.dart' as http;

import '../bin/read_key_file.dart';
import '../bin/string2md5.dart';

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

            print('Keys have been read');
            print('Private Key: ${reader.privateKey}');
            print('Public Key: ${reader.publicKey}');

            // generating hash = md5(timestamp + keys)
            var timestamp = 1;
            var digest = new Utf8String2MD5();
            var apikey = timestamp.toString() + reader.privateKey + reader.publicKey;
            var hash = digest.digest(apikey);

            print('apikey = ${apikey}');
            print('hash: ${hash}');
        });

    });

}
