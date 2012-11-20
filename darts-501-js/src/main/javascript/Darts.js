//
// Codigo completo (proyecto maven, tests, ...) se puede encontrar en:
//     https://github.com/rchavarria/solveet-problems/tree/master/darts-501-js
//
function Darts(points, nTurns) {
    this.points = points;
    this.player1Points = points;
    this.player2Points = points;
    this.winner = "";

    var turns = nTurns;
    var self = this;

    var substractTurnPoints = function(playerPoints, turnPoints) {
        var previousPoints = playerPoints;

        for(var i = 0; i < turnPoints.length; i++) {
            playerPoints -= turnPoints[i];
            // player matches, stop playing
            if(playerPoints == 0) return 0;
            // players exceeds, revert previous points
            if(playerPoints < 0) return previousPoints;
        }

        return playerPoints;
    };

    var whoWins = function() {
        var winner = "";
        if (self.player2Points == 0) winner = "player 2";
        if (self.player1Points == 0) winner = "player 1";
        return winner;
    };

    this.finished = function() {
        return turns == 0;
    };

    this.turn = function(player1Turn, player2Turn) {
        if (this.finished()) return;
        else turns--;

        this.player1Points = substractTurnPoints(this.player1Points, player1Turn);
        if(this.player1Points > 0) {
            this.player2Points = substractTurnPoints(this.player2Points, player2Turn);
        }

        this.winner = whoWins();
    };
};
