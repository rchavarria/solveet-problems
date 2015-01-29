import 'package:unittest/unittest.dart';
import '../bin/stone_paper_scissors.dart';

void main() {

    group('Game rules', () {
        var game = new Game();

        test('returns draw if choices are equals', () {
            expect(game.play('stone', 'stone'), equals('draw'));
            expect(game.play('paper', 'paper'), equals('draw'));
            expect(game.play('scissors', 'scissors'), equals('draw'));
        });

        test('paper wins stone', () {
            expect(game.play('paper', 'stone'), equals('Player 1'));
            expect(game.play('stone', 'paper'), equals('Player 2'));
        });

    });

}

