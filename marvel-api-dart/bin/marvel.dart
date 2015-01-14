import 'package:unittest/unittest.dart';
import 'package:cipher/cipher.dart';
import 'package:cipher/impl/server.dart';
import 'dart:typed_data';

// package http can be used to get remote content from the server
// documentation: https://pub.dartlang.org/packages/http
import 'package:http/http.dart' as http;

void main() {

    group('Foo bar', () {

        test('tests', () {
            expect(1, 0 + 1);
        });

        test('gets text from a URL', () {
            String baseEndpoint = 'http://gateway.marvel.com';
            String url = '${baseEndpoint}/v1/public/comics';

            http.get(url)
                .then((response) {
                    print(response.statusCode);
                });
        });

        test('calculating an MD5 digest with cipher package', () {
            initCipher();

            // Example from: https://github.com/izaera/cipher/wiki/Using-digests
            var digest = new Digest('MD5');
            var digestValue = digest.process(new Uint8List.fromList('compute md5 of this'.codeUnits));
            print('Digest value is: ${digestValue}');
        });

    });
}
