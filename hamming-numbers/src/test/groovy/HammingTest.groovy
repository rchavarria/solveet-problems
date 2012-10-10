
import static org.junit.Assert.*
import org.junit.Test
import org.junit.Before

class HammingTest extends GroovyTestCase {
    
    def hamming

    @Before
    public void setUp() {
        // select a Hamming solution: non-functional or functional
        // hamming = new Hamming()
        hamming = new FunctionalHamming()
    }

    @Test
    public void test() {
        assertEquals([1], hamming.generate(1))
        assertEquals([1, 2], hamming.generate(2))
        assertEquals([1, 2, 3], hamming.generate(3))
        assertEquals([1, 2, 3, 4], hamming.generate(4))
        assertEquals([1, 2, 3, 4, 5], hamming.generate(5))
        assertEquals([1, 2, 3, 4, 5, 6], hamming.generate(6))

        assertEquals([1, 2, 3, 4, 5, 6, 8], hamming.generate(7))
        assertEquals([1, 2, 3, 4, 5, 6, 8, 9], hamming.generate(8))
        assertEquals([1, 2, 3, 4, 5, 6, 8, 9, 10], hamming.generate(9))
        assertEquals([1, 2, 3, 4, 5, 6, 8, 9, 10, 12], hamming.generate(10))

        assertEquals([1, 2, 3, 4, 5, 6, 8, 9, 10, 12, 15], hamming.generate(11))
        assertEquals([1, 2, 3, 4, 5, 6, 8, 9, 10, 12, 15, 16], hamming.generate(12))
    }
}