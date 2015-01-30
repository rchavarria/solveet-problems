
class Game {

    String play(String choice1, String choice2) {
        if (choice1 == choice2) {
            return 'draw';
        }

        var rulesMap = {
            'scissors': {
                'stone': 'Player 2',
                'paper': 'Player 1',
                'scissors': 'draw'
            },
            'paper': {
                'stone': 'Player 1',
                'paper': 'draw',
                'scissors': 'Player 2'
             }
        };

        switch(choice1) {
        case 'scissors':
            return rulesMap[choice1][choice2];
        case 'paper':
            return rulesMap[choice1][choice2];
        case 'stone':
            if (choice2 == 'paper') {
                return 'Player 2';
            }
            break;
        }

        return 'Player 1';
    }

}
