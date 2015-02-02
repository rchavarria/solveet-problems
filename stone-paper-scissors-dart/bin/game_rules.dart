
class GameRules {

    var rulesMap = {
        'stone': {
            'stone': 'draw',
            'paper': 'Player 2',
            'scissors': 'Player 1'
        },
        'paper': {
            'stone': 'Player 1',
            'paper': 'draw',
            'scissors': 'Player 2'
        },
        'scissors': {
            'stone': 'Player 2',
            'paper': 'Player 1',
            'scissors': 'draw'
        }
    };

    String play(String choice1, String choice2) => rulesMap[choice1][choice2];

}
