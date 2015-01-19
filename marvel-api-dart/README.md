# Marvel API

Solution to the solveet.com problem: 
[Marvel API](http://www.solveet.com/exercises/Acceder-a-la-API-Marvel/299)

## Requirements

- [Dart SDK](https://www.dartlang.org) needs to be installed
- [Dart editor](https://www.dartlang.org) can be installed

## Configuration

You have to get a private and public key to access the Marvel API. Then,
store them in a file called `.env` in the root directory, that should
have the following format:

    privateKey=<your private key here>
    publicKey=<your public key here>

## Running the tests

First, you must be sure you have all dependencies. Run command `pub get`.
Or from Dart Editor, select the project, go to menu Tools > Pub get.

To run the tests from command line, type any of these commands, it depends
on which test do you want to run:

    dart test/marvel_api_test.dart
    dart test/read_key_file_test.dart
    dart test/string2md5_test.dart

To run tests from Dart editor:

- Right click on any of these files: `test/marvel_api_test.dart`,
`test/read_key_file_test.dart` or `test/string2md5_test.dart`, and choose Run

## Resources

- [Marvel API](http://developer.marvel.com/docs#!/public/getCreatorCollectionget0)
- [http Dart library](https://pub.dartlang.org/packages/http): to make HTTP requests
to the API
- [cipher Dart library](https://pub.dartlang.org/packages/cipher): to compute MD5
digests (and other crytographic functionalities)
- [cipher Wiki documentation](https://github.com/izaera/cipher/wiki)

