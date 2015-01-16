import 'dart:convert';
import 'dart:async';

import 'package:unittest/unittest.dart';
// package http can be used to get remote content from the server
// documentation: https://pub.dartlang.org/packages/http
import 'package:http/http.dart' as http;

import '../bin/read_key_file.dart';
import '../bin/string2md5.dart';
import '../bin/marvel_api.dart';

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
            var timestamp = new DateTime.now().millisecondsSinceEpoch;
            var digest = new Utf8String2MD5();
            var apikey = timestamp.toString() + reader.privateKey + reader.publicKey;
            var hash = digest.digest(apikey);

            print('apikey = ${apikey}');
            print('hash: ${hash}');

            // making the first api call to authenticate
            String baseEndpoint = 'http://gateway.marvel.com';
            String query = [
                'ts=${timestamp}',
                'apikey=${reader.publicKey}',
                'hash=${hash}'].join('&');
            String url = '${baseEndpoint}/v1/public/comics?${query}';
            print('URL: ${url}');
            http.get(url)
                .then((response) {
                    print('Real api call: ${response.statusCode}');

                    var result = JSON.decode(response.body);
                    var status = result['status'];
                    print('Result.status: ${status}');

                    var comics = result['data'];
                    print('How many comics: ${comics.length}');
                })
                .catchError((e) => print(e));
        });

    });

    group('Marvel API:', () {

        test('constructor accepts 3 params: md5 digester, private key and public key', () {
            var api = buildMarvelApi();
        });

        group('#authenticate', () {

            test('authenticates against marvel endpoint', () {
                var asyncExpectation = expectAsync((authenticated) {
                    expect(authenticated, equals(true));
                });

                buildMarvelApi()
                .authenticate()
                .then(asyncExpectation);
            });

        });

    });

}

MarvelApi buildMarvelApi() {
    var md5 = new Utf8String2MD5();
    var reader = new KeyFileReader('.env');
    reader.read();

    return new MarvelApi(md5, reader.privateKey, reader.publicKey);
}

