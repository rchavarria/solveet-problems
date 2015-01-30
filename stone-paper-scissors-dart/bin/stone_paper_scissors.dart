
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
            break;
        case 'paper':
            if (choice2 == 'scissors') {
                return 'Player 2';
            }
            break;
        case 'stone':
            if (choice2 == 'paper') {
                return 'Player 2';
            }
            break;
        }

        return 'Player 1';
    }

}
