import 'dart:math';
import 'dart:io';

import 'package:unittest/unittest.dart';
import '../bin/game_rules.dart';
import '../bin/game.dart';

void main() {
    var gameRules = new GameRules();

    group('Game rules', () {

        test('returns draw if choices are equals', () {
            expect(gameRules.play('stone', 'stone'), equals('draw'));
            expect(gameRules.play('paper', 'paper'), equals('draw'));
            expect(gameRules.play('scissors', 'scissors'), equals('draw'));
        });

        test('paper wins stone', () {
            expect(gameRules.play('paper', 'stone'), equals('Player 1'));
            expect(gameRules.play('stone', 'paper'), equals('Player 2'));
        });

        test('scissors wins paper', () {
            expect(gameRules.play('scissors', 'paper'), equals('Player 1'));
            expect(gameRules.play('paper', 'scissors'), equals('Player 2'));
        });

        test('stone wins scissors', () {
            expect(gameRules.play('stone', 'scissors'), equals('Player 1'));
            expect(gameRules.play('scissors', 'stone'), equals('Player 2'));
        });

    });

    group('Random numbers', () {

        test('how to generate them', () {
            var random = new Random();
            var randomNumber = random.nextInt(3);
            expect(randomNumber, greaterThanOrEqualTo(0));
            expect(randomNumber, lessThan(3));
        });

        test('gameRules generates a choice randomly', () {
            var randomChoice = gameRules.generateRandomChoice();
            expect(randomChoice, anyOf(equals('stone'), equals('paper'), equals('scissors')));
        });

    });

    group('Game', () {

        test('#execute', () {
            var game = new Game();
            game.execute();
        });

    });

}

