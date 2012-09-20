
import Player.Scores

class Set {

    def playerA = new Player()
    def playerB = new Player()
    def game = new Game(playerA: playerA, playerB: playerB)
    def winner 

    def scores(String player){
        game.score(player)
        
        checkIfPlayerWonAGame(playerA)
        checkIfPlayerWonAGame(playerB)
        
        checkWinner()
    }
    
    private checkIfPlayerWonAGame(player){
        if(player.score == Scores.GAME) {
            player.games++
            
            game.resetGame()
        }
    }
    
    private checkWinner() {
        if(playerA.games == 6) winner = "A"
        else if(playerB.games == 6) winner = "B"
        else winner = null
    }
}
