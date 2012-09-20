import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;


class SetTest {
    
    def sut

    @Before
    public void setUp() throws Exception {
        sut = new Set()
    }
    
    @Test
    public void testInitialScore() {
        assertEquals(0, sut.playerA.games)
        assertEquals(0, sut.playerB.games)
    }
    
    private checkPlayerSets(scores, playerASets, playerBSets){
        scores.each {
            sut.scores it
        }
        
        assertEquals(playerASets, sut.playerA.games)
        assertEquals(playerBSets, sut.playerB.games)
    }

    @Test
    public void testPlayerAWinsFirstSet() {
        checkPlayerSets("AAAA", 1, 0)
    }
    
    @Test
    public void testPlayerBWinsFirstSet() {
        checkPlayerSets("BBBB", 0, 1)
    }
    
    @Test
    public void testEachPlayerWinSeveralSets() {
        def scores = ("A"*4) + ("B"*4) + ("A"*4) + ("B"*4) + ("A"*4) + ("B"*4) + ("A"*4) + ("B"*4) + ("A"*4) + ("B"*4)
        checkPlayerSets(scores, 5, 5)
    }
    
    @Test
    public void testPlayerAWinsASet() {
        // A scores 4 times 6 games
        checkPlayerSets("A"*4*6, 6, 0)
        assertEquals("A", sut.winner)
    }
}
