
import static org.junit.Assert.*
import org.junit.Test
import org.junit.Before

class BinarySumTest extends GroovyTestCase {
    
    def binarysum

    @Before
    public void setUp() {
        binarysum = new BinarySum()
    }

    @Test
    public void testBruteForce() {
        assertEquals( [1, 0], binarysum.bruteForce(1) )
        assertEquals( [1, 1], binarysum.bruteForce(2) )
        assertEquals( [1, 2], binarysum.bruteForce(3) )
        assertEquals( [2, 3], binarysum.bruteForce(5) )
        assertEquals( [8, 15], binarysum.bruteForce(23) )
        assertEquals( [20, 63], binarysum.bruteForce(83) )
        assertEquals( [33, 63], binarysum.bruteForce(96) )
    }

    @Test
    public void testUsingPowersOfTwo() {
        assertEquals( [1, 0], binarysum.usingPowersOfTwo(1) )
        assertEquals( [1, 1], binarysum.usingPowersOfTwo(2) )
        assertEquals( [1, 2], binarysum.usingPowersOfTwo(3) )
        assertEquals( [2, 3], binarysum.usingPowersOfTwo(5) )
        assertEquals( [8, 15], binarysum.usingPowersOfTwo(23) )
        assertEquals( [20, 63], binarysum.usingPowersOfTwo(83) )
        assertEquals( [33, 63], binarysum.usingPowersOfTwo(96) )
    }
}