
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
        check("", "")
    }

    @Test
    public void testInput_a() {
        check("a", "1a")
    }

    @Test
    public void testInput_aa() {
        check("aa", "2a")
    }


    @Test
    public void testInput_ab() {
        check("ab", "1a1b")        
    }

    private void check(input, expected) {
        def actual = compressor.rle(input)
        assertEquals(expected, actual)
    }
}