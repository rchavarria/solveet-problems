
import static org.junit.Assert.*
import org.junit.Test
import org.junit.Before

class RouterTest extends GroovyTestCase {
    
    def router

    @Before
    public void setUp() {
        router = new Router()
    }

    @Test
    public void testSingleCellWithoutRoute() {
        def map = [ [1] ]
        def route = ""

        def position = router.follow(map, route)
        
        def expectedPosition = [1, 1]
        assertEquals(expectedPosition, position)
    }

    @Test
    public void testSingleRowWithoutRoute() {
        def map = [ [1, 1, 1, 0] ]
        def route = ""

        def position = router.follow(map, route)
        
        def expectedPosition = [1, 1]
        assertEquals(expectedPosition, position)
    }

    @Test
    public void testSingleRowRoute_EE() {
        def map = [ [1, 1, 1, 0] ]
        def route = "EE"

        def position = router.follow(map, route)
        
        def expectedPosition = [1, 3]
        assertEquals(expectedPosition, position)
    }

    @Test
    public void testSingleRowRoute_EEE() {
        def map = [ [1, 1, 1, 0] ]
        def route = "EEE"

        def position = router.follow(map, route)
        
        def expectedPosition = -1
        assertEquals(expectedPosition, position)
    }

    @Test
    public void testSingleRowRoute_EEEE() {
        def map = [ [1, 1, 1, 1] ]
        def route = "EEEE"

        def position = router.follow(map, route)
        
        def expectedPosition = -1
        assertEquals(expectedPosition, position)
    }

    @Test
    public void testTwoRowsRoute_SEE() {
        def map = [ [1,0,1], [1,1,1]]
        def route = "SEE"

        def position = router.follow(map, route)
        
        def expectedPosition = [2, 3]
        assertEquals(expectedPosition, position)
    }

    @Test
    public void testTwoRowsRoute_SEEN() {
        def map = [ [1,0,1], [1,1,1]]
        def route = "SEEN"

        def position = router.follow(map, route)
        
        def expectedPosition = [1, 3]
        assertEquals(expectedPosition, position)
    }

    @Test
    public void testTwoRowsRoute_SEENS() {
        def map = [ [1,0,1], [1,1,1]]
        def route = "SEENS"

        def position = router.follow(map, route)
        
        def expectedPosition = [2, 3]
        assertEquals(expectedPosition, position)
    }

    @Test
    public void testTwoRowsRoute_SENW() {
        def map = [ [1,1,0], [1,1,0], [0,1,0] ]
        def route = "SENW"

        def position = router.follow(map, route)
        
        def expectedPosition = [1, 1]
        assertEquals(expectedPosition, position)
    }

    @Test
    public void testSeveralRowsComplexRoute() {
        def map = [ 
            [1,1,1,0], 
            [1,1,1,1],
            [0,1,1,1],
            [0,0,1,1] ]
        def route = "SESESENNWNWW"

        def position = router.follow(map, route)
        
        def expectedPosition = [1, 1]
        assertEquals(expectedPosition, position)
    }
}