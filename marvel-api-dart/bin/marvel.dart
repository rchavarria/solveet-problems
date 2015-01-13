import 'package:unittest/unittest.dart';

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

    });
}
