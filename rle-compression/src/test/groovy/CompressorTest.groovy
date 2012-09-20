
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

    @Test
    public void testSeveralInputs() {
        check("aabb", "2a2b")
        check("aaaaa", "5a")
        check("aaaaabbbbbcccccdddddeeeee", "5a5b5c5d5e")
        check("AAaaAAaaAA", "2A2a2A2a2A")
        check("abcdefghijklmnopqrstuvwxyz", "1a1b1c1d1e1f1g1h1i1j1k1l1m1n1o1p1q1r1s1t1u1v1w1x1y1z")
    }

    private void check(input, expected) {
        def actual = compressor.rle(input)
        assertEquals(expected, actual)
    }
}