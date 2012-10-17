
import static org.junit.Assert.*
import org.junit.Test
import org.junit.Before

class BarClientFileTest extends GroovyTestCase {
    
    def barClient

    @Before
    public void setUp() {
        barClient = new BarClient()
    }

    @Test
    public void testReadZeroBarsFromFile() {
        def output = barClient.parseFile("src/test/resources/zerobars.txt")
        assertEquals("", output)
    }

    @Test
    public void testReadOneBarFromFile() {
        def output = barClient.parseFile("src/test/resources/onebar.txt")
        assertEquals("bufff\n", output)
    }

    @Test
    public void testReadOneBarWithoutBathroom() {
        def output = barClient.parseFile("src/test/resources/nobathroom.txt")
        assertEquals("ui ui ui\n", output)
    }

    @Test
    public void testExample() {
        def output = barClient.parseFile("src/test/resources/example.txt")
        assertEquals("bufff\nbufff\n", output)
    }
}