
import static org.junit.Assert.*
import org.junit.Test
import org.junit.Before

class LooplessTest extends GroovyTestCase {
    
    def loopless

    @Before
    public void setUp() {
        loopless = new Loopless()
    }

    @Test
    public void testEmptyRoute() {
    	check("", "")
    }

    @Test
    public void testRoute_SENW() {
    	check("SENW", "")
    }

    @Test
    public void testRoute_SSNN() {
    	check("SSNN", "")
    }

    @Test
    public void testRoute_SEEW() {
    	check("SEEW", "SE")
    }

    @Test
    public void testRouteOthers() {
    	check("SEEESWWNNW", "")
    	check("ESWWNNEEESSSWWWWNNNNEE", "NN")
    	check("SWNNESESWNNESWW", "W")
    }

    private check(route, expected) {
        def actual = loopless.undoLoops(route)
        assertEquals(expected, actual)
    }

}