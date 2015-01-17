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

        group('#comics', () {

            test('retrieves first page (20 items) of comics from marvel', () {
                var asyncExpectation = expectAsync((comics) {
                    expect(comics.length, equals(20));
                });

                var api = buildMarvelApi();
                api.authenticate()
                    .then((_) => api.comics())
                    .then(asyncExpectation);
            });

            test('each comic has id, title, description and thumbnailUrl as properties', () {
                var asyncExpectation = expectAsync((comics) {
                    var comic = comics[0];
                    expect(comic.id, isPositive);
                    expect(comic.title, isNot(isEmpty));
                    expect(comic.description, isNot(isEmpty));
                    expect(comic.thumbnailUrl, isNot(isEmpty));
                });

                var api = buildMarvelApi();
                api.authenticate()
                    .then((_) => api.comics())
                    .then(asyncExpectation);
            });

            test('allows search a comic by id', () {
                var asyncExpectation = expectAsync((comic) {
                    expect(comic.id, equals(41530));
                    expect(comic.title, contains('Ant-Man'));
                    expect(comic.description, contains('Hank Pym'));
                    expect(comic.thumbnailUrl, contains('http://i.annihil.us'));
                });

                var api = buildMarvelApi();
                api.authenticate()
                    .then((_) => api.comicById(41530))
                    .then(asyncExpectation);
            });

        });

        group('#characters', () {

            test('retrieves first page (20 items) of characters from marvel', () {
                var asyncExpectation = expectAsync((characters) {
                    expect(characters.length, equals(20));
                });

                var api = buildMarvelApi();
                api.authenticate()
                    .then((_) => api.characters())
                    .then(asyncExpectation);
            });

            test('each character has name, description and thumbnailUrl as properties', () {
                var asyncExpectation = expectAsync((characters) {
                    var character = characters[0];
                    expect(character.id, isPositive);
                    expect(character.name, isNot(isEmpty));
                    expect(character.description, isEmpty);
                    expect(character.thumbnailUrl, isNot(isEmpty));
                });

                var api = buildMarvelApi();
                api.authenticate()
                    .then((_) => api.characters())
                    .then(asyncExpectation);
            });

            test('allows search a character by id', () {
                var asyncExpectation = expectAsync((character) {
                    expect(character.id, equals(1011334));
                    expect(character.name, contains('3-D Man'));
                    expect(character.thumbnailUrl, contains('http://i.annihil.us'));
                });

                var api = buildMarvelApi();
                api.authenticate()
                    .then((_) => api.characterById(1011334))
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

