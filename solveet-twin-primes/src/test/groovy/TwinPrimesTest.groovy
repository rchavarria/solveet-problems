
import static org.junit.Assert.*
import org.junit.Test
import org.junit.Before


class TwinPrimesTest extends GroovyTestCase {

    private twins
    
    @Before
    public void setUp() {
        twins = new TwinPrimes()
    }
    
    @Test
    public void testOneAndTwoArentTwin() {
        assertFalse twins.areTwin(1, 2)
    }
    
    @Test
    public void testThreeAndFiveAreTwin() {
        assertTrue twins.areTwin(3, 5)
    }
    
    @Test
    public void testSevenAndNineArentTwin() {
        assertFalse twins.areTwin(7, 9)
    }
    
    @Test
    public void testElevenAndThirteenAreTwin() {
        assertTrue twins.areTwin(11, 13)
    }
}