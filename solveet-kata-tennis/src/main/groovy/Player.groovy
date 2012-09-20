
class Player {

    enum Scores {
        ZERO,
        LOVE,
        THIRTY,
        FORTY,
        DEUCE,
        ADVANTAGE,
        
        GAME
    }
    
    def score = Scores.ZERO
    def games = 0
    
    def scores(opponent) {
        switch(score){
            case Scores.ZERO:
                score = Scores.LOVE
                break
            case Scores.LOVE:
                score = Scores.THIRTY
                break
            case Scores.THIRTY:
                checkPossibleDeuce(opponent)
                break
            case Scores.FORTY:
                checkPossibleDeuceAfterAdvantage(opponent)
                break
            case Scores.DEUCE:
                score = Scores.ADVANTAGE
                opponent.score = Scores.FORTY
                break
            case Scores.ADVANTAGE:
                score = Scores.GAME
                break
        }
        
    }
    
    def reset() {
        score = Scores.ZERO
    }
    
    private checkPossibleDeuce(opponent) {
        if(opponent.score == Scores.FORTY){
            setDeuceScore(opponent)
        } else {
            score = Scores.FORTY
        }
    }

    private setDeuceScore(opponent){
        score = Scores.DEUCE
        opponent.score = Scores.DEUCE
    }
        
    private checkPossibleDeuceAfterAdvantage(opponent){
        if(opponent.score == Scores.ADVANTAGE){
            setDeuceScore(opponent)
        } else {
            score = Scores.GAME
        }
    }
}
