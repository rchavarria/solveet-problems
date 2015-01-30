
class Game {

    String play(String choice1, String choice2) {
        if (choice1 == choice2) {
            return 'draw';
        }

        if (choice1 == 'scissors') {
            return 'Player 1';
        } else if (choice2 == 'scissors') {
            return 'Player 2';
        }

        if (choice1 == 'paper') {
            return 'Player 1';
        }

        return 'Player 2';
    }

}
