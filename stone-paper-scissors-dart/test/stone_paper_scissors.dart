import 'package:unittest/unittest.dart';
import '../bin/stone_paper_scissors.dart';

void main() {

    group('Hook up', () {

        test('hooks up', () {
            expect(2 + 2, equals(4));
        });

    });

    group('Game rules', () {

        test('returns draw if choices are equals', () {
            var game = new Game();
            var gameResult = game.play('stone', 'stone');
            expect(gameResult, equals('draw'));
        });
    });

}

