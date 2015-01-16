import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;

import 'read_key_file.dart';
import 'string2md5.dart';
import 'comic.dart';
import 'character.dart';

class MarvelApi {

    static const BASE_ENDPOINT = 'http://gateway.marvel.com';
    static const API_VERSION = '/v1/public/';

    Utf8String2MD5 md5;
    String privateKey;
    String publicKey;
    int timestamp;

    MarvelApi(this.md5, this.privateKey, this.publicKey) {
        timestamp = new DateTime.now().millisecondsSinceEpoch;
    }

    Future authenticate() {
        return makeApiRequest('comics')
            .then((response) {
                var success = response.statusCode == 200;
                return new Future.value(success);
            });
    }

    Future comics() {
        return extractResultsFromRequest('comics')
            .then((results) {
                var comics = results
                    .map((c) => new Comic.fromJson(c))
                    .toList();

                return new Future.value(comics);
            });
    }

    Future characters() {
        return extractResultsFromRequest('characters')
            .then((results) {
                var characters = results
                    .map((c) => new Character.fromJson(c))
                    .toList();

                return new Future.value(characters);
            });
    }

    Future makeApiRequest(entity) {
        timestamp += 1;
        var authenticationToken = timestamp.toString() + privateKey + publicKey;
        var hash = md5.digest(authenticationToken);

        String query = [
            'ts=${timestamp}',
            'apikey=${publicKey}',
            'hash=${hash}'].join('&');
        String url = '${BASE_ENDPOINT}${API_VERSION}${entity}?${query}';

        return http.get(url);
    }

    Future extractResultsFromRequest(entity) {
        return makeApiRequest(entity)
            .then((response) {
                var body = JSON.decode(response.body);
                var results = body['data']['results'];
                return new Future.value(results);
            });
    }

}

