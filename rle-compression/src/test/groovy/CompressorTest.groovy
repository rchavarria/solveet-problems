
import static org.junit.Assert.*
import org.junit.Test
import org.junit.Before

class CompressorTest extends GroovyTestCase {

    private compressor
    
    @Before
    public void setUp() {
        compressor = new Compressor()
    }
    
    @Test
    public void testEmptyInput() {
        def actual = compressor.rle("")
        def expected = ""
        assertEquals(expected, actual)
    }

    @Test
    public void testInput_a() {
        def actual = compressor.rle("a")
        def expected = "1a"
        assertEquals(expected, actual)
    }
}