
class Game {

    String play(String choice1, String choice2) {
        if (choice1 == choice2) {
            return 'draw';
        }

        switch(choice1) {
        case 'scissors':
            if (choice2 == 'stone') {
                return 'Player 2';
            }
            return 'Player 1';
        case 'paper':
            if (choice2 == 'scissors') {
                return 'Player 2';
            }
            return 'Player 1';
        case 'stone':
            if (choice2 == 'paper') {
                return 'Player 2';
            }
            return 'Player 1';
        }
    }

}
