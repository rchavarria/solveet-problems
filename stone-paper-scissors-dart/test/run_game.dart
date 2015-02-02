import '../bin/game.dart';

void main() {
    var game = new Game();
    [0, 1, 2, 3, 4].forEach((_) {
        game.execute();
    });
}

