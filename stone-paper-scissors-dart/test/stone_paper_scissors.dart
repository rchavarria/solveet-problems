import 'dart:math';
import 'dart:io';

import 'package:unittest/unittest.dart';
import '../bin/stone_paper_scissors.dart';

void main() {
    var game = new Game();

    group('Game rules', () {

        test('returns draw if choices are equals', () {
            expect(game.play('stone', 'stone'), equals('draw'));
            expect(game.play('paper', 'paper'), equals('draw'));
            expect(game.play('scissors', 'scissors'), equals('draw'));
        });

        test('paper wins stone', () {
            expect(game.play('paper', 'stone'), equals('Player 1'));
            expect(game.play('stone', 'paper'), equals('Player 2'));
        });

        test('scissors wins paper', () {
            expect(game.play('scissors', 'paper'), equals('Player 1'));
            expect(game.play('paper', 'scissors'), equals('Player 2'));
        });

        test('stone wins scissors', () {
            expect(game.play('stone', 'scissors'), equals('Player 1'));
            expect(game.play('scissors', 'stone'), equals('Player 2'));
        });

    });

    group('Random numbers', () {

        test('how to generate them', () {
            var random = new Random();
            var randomNumber = random.nextInt(3);
            expect(randomNumber, greaterThanOrEqualTo(0));
            expect(randomNumber, lessThan(3));
        });

        test('game generates a choice randomly', () {
            var randomChoice = game.generateRandomChoice();
            expect(randomChoice, anyOf(equals('stone'), equals('paper'), equals('scissors')));
        });

    });

    group('Standard input', () {

        test('how to read from stdin', () {
            print('Write foobar');
            String line = stdin.readLineSync();
            expect(line, equals('foobar'));
        });

    });

}

