import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;

import 'read_key_file.dart';
import 'string2md5.dart';
import 'comic.dart';
import 'character.dart';

/**
  * Class to access Marvel public API v1
  */
class MarvelApi {

    static const BASE_ENDPOINT = 'http://gateway.marvel.com';
    static const API_VERSION = '/v1/public/';

    /* compute the MD5 hash in every request */
    Utf8String2MD5 md5;
    /* user private key to acces the api */
    String privateKey;
    /* user public key to acces the api */
    String publicKey;
    /* number that must change from request to request */
    int timestamp;

    MarvelApi(this.md5, this.privateKey, this.publicKey) {
        timestamp = new DateTime.now().millisecondsSinceEpoch;
    }

    /**
      * The first call to the api must be a call to authenticate the user
      * @return Future which resolves to a Boolean value stating if the
      * authentication succeeded or not
      */
    Future<Boolean> authenticate() {
        return makeApiRequest('comics')
            .then((response) {
                return response.statusCode == 200;
            });
    }

    /**
      * Retrieves a list of comics
      */
    Future<List<Comic>> comics() {
        return retrieveEntity('comics', (c) => new Comic.fromJson(c));
    }

    /**
      * Retrieve a single comic by its id
      */
    Future<Comic> comicById(int id) {
        return retrieveEntity('comics/${id}', (c) => new Comic.fromJson(c))
            .then((comicInAList) => comicInAList[0]);
    }

    /**
      * Retrieve a list of characters
      */
    Future<List<Character>> characters() {
        return retrieveEntity('characters', (c) => new Character.fromJson(c));
    }

    /**
      * Retrieve a single character by its id
      */
    Future<Character> characterById(int id) {
        return retrieveEntity('characters/${id}', (c) => new Character.fromJson(c))
            .then((characterInAList) => characterInAList[0]);
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

    Future retrieveEntity(entity, mapper) {
        return makeApiRequest(entity)
            .then((response) {
                var body = JSON.decode(response.body);
                var results = body['data']['results'];
                var entities = results
                    .map(mapper)
                    .toList();

                return entities;
            });
    }

}

