import 'package:unittest/unittest.dart';
import '../bin/stone_paper_scissors.dart';

void main() {

    group('Game rules', () {

        test('returns draw if choices are equals', () {
            var game = new Game();
            var gameResult = game.play('stone', 'stone');
            expect(gameResult, equals('draw'));
        });

        test('paper wins stone', () {
            var game = new Game();
            var gameResult = game.play('paper', 'stone');
            expect(gameResult, equals('Player 1'));
        });

    });

}

