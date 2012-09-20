
import Player.Scores

class Game {

    def winner
    def playerA
    def playerB

    def score(String player) {
        if("A".equals(player)){
            playerA.scores(playerB)
        } else {
            playerB.scores(playerA)
        }

        winner = checkWinner()        
    }
    
    def resetGame(){
        playerA.reset()
        playerB.reset()
        winner = null
    }
    
    private checkWinner(){
        if (playerA.score == Scores.GAME) return "A"
        if (playerB.score == Scores.GAME) return "B"
        return null
    }
}
