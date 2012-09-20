
import static org.junit.Assert.*
import org.junit.Test
import org.junit.Before

class CòmpressorTest extends GroovyTestCase {

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
}