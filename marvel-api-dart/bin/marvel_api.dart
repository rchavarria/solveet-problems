import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;

import 'read_key_file.dart';
import 'string2md5.dart';

class MarvelApi {

    Utf8String2MD5 md5;
    String privateKey;
    String publicKey;
    int timestamp;

    MarvelApi(this.md5, this.privateKey, this.publicKey) {
        timestamp = new DateTime.now().millisecondsSinceEpoch;
    }

    Future authenticate() {
        var authenticationToken = timestamp.toString() + privateKey + publicKey;
        var hash = md5.digest(authenticationToken);

        // making the first api call to authenticate
        String baseEndpoint = 'http://gateway.marvel.com';
        String query = [
            'ts=${timestamp}',
            'apikey=${publicKey}',
            'hash=${hash}'].join('&');
        String url = '${baseEndpoint}/v1/public/comics?${query}';

        return http.get(url)
            .then((response) {
                var success = response.statusCode == 200;
                return new Future.value(success);
            });
    }

    Future comics() {
        timestamp += 1;
        var authenticationToken = timestamp.toString() + privateKey + publicKey;
        var hash = md5.digest(authenticationToken);

        // making the first api call to authenticate
        String baseEndpoint = 'http://gateway.marvel.com';
        String query = [
            'ts=${timestamp}',
            'apikey=${publicKey}',
            'hash=${hash}'].join('&');
        String url = '${baseEndpoint}/v1/public/comics?${query}';

        return http.get(url)
            .then((response) {
                var result = JSON.decode(response.body);
                var comics = result['data'];

                return new Future.value(comics);
            });
    }

}

