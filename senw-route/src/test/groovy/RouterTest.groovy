
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

}