
import static org.junit.Assert.*
import org.junit.Test
import org.junit.Before

class LoopesRouteTest extends GroovyTestCase {
    
    def route

    @Before
    public void setUp() {
        route = new LoopesRoute()
    }

    @Test
    public void testEmptyRoute() {
        assertEquals("", route.makeItLoopless(""))
    }

    @Test
    public void testMoveToEastAndReturn() {
        assertEquals("E", route.makeItLoopless("E"))
        assertEquals("", route.makeItLoopless("EW"))
        assertEquals("E", route.makeItLoopless("EEW"))
        assertEquals("", route.makeItLoopless("EEWW"))
        assertEquals("", route.makeItLoopless("EWEW"))
        assertEquals("E", route.makeItLoopless("EEEWW"))
    }

    @Test
    public void testMoveToWestAndReturn() {
        assertEquals("W", route.makeItLoopless("W"))
        assertEquals("", route.makeItLoopless("WE"))
        assertEquals("W", route.makeItLoopless("WWE"))
        assertEquals("", route.makeItLoopless("WWEE"))
        assertEquals("", route.makeItLoopless("WEWE"))
        assertEquals("W", route.makeItLoopless("WWWEE"))
    }

    @Test
    public void testMoveToSouthAndReturn() {
        assertEquals("S", route.makeItLoopless("S"))
        assertEquals("", route.makeItLoopless("SN"))
        assertEquals("S", route.makeItLoopless("SSN"))
        assertEquals("", route.makeItLoopless("SSNN"))
        assertEquals("", route.makeItLoopless("SNSN"))
        assertEquals("S", route.makeItLoopless("SSSNN"))
    }

    @Test
    public void testMoveToNorthAndReturn() {
        assertEquals("N", route.makeItLoopless("N"))
        assertEquals("", route.makeItLoopless("NS"))
        assertEquals("N", route.makeItLoopless("NNS"))
        assertEquals("", route.makeItLoopless("NNSS"))
        assertEquals("", route.makeItLoopless("NSNS"))
        assertEquals("N", route.makeItLoopless("NNNSS"))
    }

    @Test
    public void testExampleTests() {
        assertEquals("", route.makeItLoopless("SENW"))
        assertEquals("SE", route.makeItLoopless("SEEW"))
        assertEquals("", route.makeItLoopless("SEEESWWNNW"))
        assertEquals("W", route.makeItLoopless("SWNNESESWNNESWW"))

        //previous test which result was 'NN', now there is no loop, so it is the same
        assertEquals("ESWWNNEEESSSWWWWNNNNEE", route.makeItLoopless("ESWWNNEEESSSWWWWNNNNEE"))
        // previous solution would be 'NE', now only the loop is removed and the path is preserved
        assertEquals("WNEE", route.makeItLoopless("WWSENNEE"))
    }
}