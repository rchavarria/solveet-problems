
import static org.junit.Assert.*
import org.junit.Before
import org.junit.Test


class MineTest extends GroovyTestCase {

    def mine
    
    @Before
    void setUp(){
        mine = new Mine()
    }
    
    @Test
    void testEmptyMine() {
        assertEquals(0, mine.searchDiamonds(""))
    }

    @Test
    void testOnlyLeftSides(){
    	assertEquals(0, mine.searchDiamonds("<"))
    	assertEquals(0, mine.searchDiamonds("<<"))
    	assertEquals(0, mine.searchDiamonds("<<<<"))
    	assertEquals(0, mine.searchDiamonds("<<<<<<<<<<"))
    }

    @Test
    void testOnlyRightSides(){
    	assertEquals(0, mine.searchDiamonds(">"))
    	assertEquals(0, mine.searchDiamonds(">>"))
    	assertEquals(0, mine.searchDiamonds(">>>"))
    	assertEquals(0, mine.searchDiamonds(">>>>>>>>>>"))
    }

    @Test
    void testOneSimpleDiamond(){
    	assertEquals(1, mine.searchDiamonds("<>"))
    	assertEquals(1, mine.searchDiamonds("<<>"))
    	assertEquals(1, mine.searchDiamonds("<<<<<<<<<<<<>"))
    	assertEquals(1, mine.searchDiamonds("<>>>>>>>>>>>>"))
    	assertEquals(1, mine.searchDiamonds("<<<<<<<<<><<<"))
    }

    @Test
    void testSeveralSimpleDiamonds(){
    	// two diamonds
    	assertEquals(2, mine.searchDiamonds("<><>"))
    	assertEquals(2, mine.searchDiamonds("<<<<<<<<<<<<<<><>"))
    	assertEquals(2, mine.searchDiamonds("<><<<<<<<<<<<<<<>"))
    	assertEquals(2, mine.searchDiamonds("<><><<<<<<<<<<<<<"))
    	assertEquals(2, mine.searchDiamonds(">>>>>>>>>>>>><><>"))
    	assertEquals(2, mine.searchDiamonds("<>>>>>>>>>>>>>><>"))
    	assertEquals(2, mine.searchDiamonds("<><>>>>>>>>>>>>>>"))
    	assertEquals(2, mine.searchDiamonds("<<<<<><<<<<<><<<<"))
    	assertEquals(2, mine.searchDiamonds(">>>><>>>>><>>>>>>"))

    	// three
    	assertEquals(3, mine.searchDiamonds("<><><>"))
    	assertEquals(3, mine.searchDiamonds("<<<<<><<<<<<><<<<<<><<<<<"))
    	assertEquals(3, mine.searchDiamonds(">>>>><>>>>>><>>>>>><>>>>>"))

    	// four
    	assertEquals(4, mine.searchDiamonds("<<<<<<><<<<<><<<<<><<<<<><<<<"))
    	assertEquals(4, mine.searchDiamonds(">>>>>><>>>>><>>>><><>>>>>>><"))
    }

    @Test
    void testCompoundDiamonds(){
    	assertEquals(2, mine.searchDiamonds("<<>>"))

    	assertEquals(3, mine.searchDiamonds("<<<>>>"))
    	assertEquals(3, mine.searchDiamonds("<<><>>"))
    	assertEquals(3, mine.searchDiamonds("<><<>><<"))
    }
}