
import static org.junit.Assert.*
import org.junit.Test
import org.junit.Before

class BinarySequenceTest extends GroovyTestCase {
    
    def sequence

    @Before
    public void setUp() {
        sequence = new BinarySequence()
    }

    @Test
    public void testLenghtOne() {
        def actual = sequence.periodicLenght("1")
        def expected = 1
        assertEquals(expected, actual)
    }
}