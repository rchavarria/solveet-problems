import 'package:unittest/unittest.dart';
import '../bin/stone_paper_scissors.dart';

void main() {

    group('Game rules', () {

        test('returns draw if choices are equals', () {
            var game = new Game();
            expect(game.play('stone', 'stone'), equals('draw'));
            expect(game.play('paper', 'paper'), equals('draw'));
            expect(game.play('scissors', 'scissors'), equals('draw'));
        });

        test('paper wins stone', () {
            var game = new Game();
            expect(game.play('paper', 'stone'), equals('Player 1'));
        });

    });

}

