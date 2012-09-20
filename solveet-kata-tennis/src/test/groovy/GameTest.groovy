
import static org.junit.Assert.*
import org.junit.Test
import org.junit.Before
import Player.Scores

class GameTest extends GroovyTestCase {

    def sut
    
    @Before
    public void setUp(){
        sut = new Game()
        sut.playerA = new Player()
        sut.playerB = new Player()
    }
    
    private checkScores(def points, def expectedAScore, def expectedBScore, def expectedWinner){
        points.each {
            sut.score it
        }
        
        assertEquals(expectedAScore, sut.playerA.score)
        assertEquals(expectedBScore, sut.playerB.score)
        assertEquals(expectedWinner, sut.winner)
    }
    
    @Test
    public void testPlayerAScoresOnce() {
        checkScores("A", Scores.LOVE, Scores.ZERO, null)
    }
    
    @Test
    public void testPlayerBScoresOnce() {
        checkScores("B", Scores.ZERO, Scores.LOVE, null)
    }
    
    @Test
    public void testPlayerAScoresTwice() {
        checkScores("AA", Scores.THIRTY, Scores.ZERO, null)
    }
    
    @Test
    public void testPlayerBScoresTwice() {
        checkScores("BB", Scores.ZERO, Scores.THIRTY, null)
    }
    
    @Test
    public void testPlayerAScoresForty() {
        checkScores("AAA", Scores.FORTY, Scores.ZERO, null)
    }
    
    @Test
    public void testPlayerBScoresForty() {
        checkScores("BBB", Scores.ZERO, Scores.FORTY, null)
    }
    
    @Test
    public void testPlayerAWin() {
        checkScores("AAAA", Scores.GAME, Scores.ZERO, "A")
    }
    
    @Test
    public void testPlayerBWin() {
        checkScores("BBBB", Scores.ZERO, Scores.GAME, "B")
    }
    
    @Test
    public void testPlayerAScoresDeuce() {
        checkScores("BBBAAA", Scores.DEUCE, Scores.DEUCE, null)
    }
    
    @Test
    public void testPlayerBScoresDeuce() {
        checkScores("AAABBB", Scores.DEUCE, Scores.DEUCE, null)
    }
    
    @Test
    public void testPlayerAScoresAdvantage() {
        checkScores("AAABBBA", Scores.ADVANTAGE, Scores.FORTY, null)
    }
    
    @Test
    public void testPlayerBScoresAdvantage() {
        checkScores("BBBAAAB", Scores.FORTY, Scores.ADVANTAGE, null)
    }
    
    @Test
    public void testPlayerAScoresDeuceAfterAdvantage() {
        checkScores("BBBAAABA", Scores.DEUCE, Scores.DEUCE, null)
    }
    
    @Test
    public void testPlayerBScoresDeuceAfterSeveralAdvantages() {
        checkScores("BBBAAABAAB", Scores.DEUCE, Scores.DEUCE, null)
    }
    
    @Test
    public void testPlayerAWinAfterAdvantage() {
        checkScores("BBBAAABAABAA", Scores.GAME, Scores.FORTY, "A")
    }
    
    @Test
    public void testPlayerBWinAfterAdvantage() {
        checkScores("BBBAAABB", Scores.FORTY, Scores.GAME, "B")
    }
    
    @Test
    public void testResetGame() {
        checkScores("ABABA", Scores.FORTY, Scores.THIRTY, null)
        sut.resetGame()
        
        checkScores("", Scores.ZERO, Scores.ZERO, null)
    }
}