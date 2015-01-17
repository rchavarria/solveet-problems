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
                return response.statusCode == 200;
            });
    }

    Future comics() {
        return extractResultsFromRequest('comics')
            .then((results) {
                var comics = results
                    .map((c) => new Comic.fromJson(c))
                    .toList();

                return comics;
            });
    }

    Future comicById(int id) {
        return extractResultsFromRequest('comics/${id}')
            .then((results) {
                var comics = results
                    .map((c) => new Comic.fromJson(c))
                    .toList();

                return comics[0];
            });
    }

    Future characters() {
        return extractResultsFromRequest('characters')
            .then((results) {
                var characters = results
                    .map((c) => new Character.fromJson(c))
                    .toList();

                return characters;
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
                return results;
            });
    }

}

