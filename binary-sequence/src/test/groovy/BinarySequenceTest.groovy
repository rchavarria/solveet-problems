
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
        assertEquals(1, sequence.periodicLength("1"))
        assertEquals(1, sequence.periodicLength("0"))
    }

    @Test
    public void testLenghtTwo() {
        assertEquals(1, sequence.periodicLength("11"))
        assertEquals(1, sequence.periodicLength("00"))
        
        assertEquals(0, sequence.periodicLength("01"))
        assertEquals(0, sequence.periodicLength("10"))
    }

    @Test
    public void testLenghtThree() {
        assertEquals(1, sequence.periodicLength("111"))
        assertEquals(1, sequence.periodicLength("000"))
        
        assertEquals(0, sequence.periodicLength("011"))
        assertEquals(0, sequence.periodicLength("100"))

        assertEquals(0, sequence.periodicLength("101"))
        assertEquals(0, sequence.periodicLength("010"))
    }

    @Test
    public void testLenghtFour() {
        assertEquals(1, sequence.periodicLength("1111"))
        assertEquals(1, sequence.periodicLength("0000"))
        
        assertEquals(2, sequence.periodicLength("0101"))
        assertEquals(2, sequence.periodicLength("1010"))

        assertEquals(0, sequence.periodicLength("1011"))
        assertEquals(0, sequence.periodicLength("0011"))
        assertEquals(0, sequence.periodicLength("1101"))
        assertEquals(0, sequence.periodicLength("0001"))
    }

    @Test
    public void testRegionsThatMatch() {
        assertEquals(5, sequence.periodicLength("10110101101011010110"))
        assertEquals(5, sequence.periodicLength("1011010110101101011010"))

        assertEquals(6, sequence.periodicLength("110111110111110111"))
        assertEquals(6, sequence.periodicLength("110111110111110111110"))
    }

    @Test
    public void testRegionsThatDontMatch() {
        assertEquals(0, sequence.periodicLength("101101011011011010110"))
        assertEquals(0, sequence.periodicLength("10110110110101101011010"))

        assertEquals(0, sequence.periodicLength("1101111101110110111"))
        assertEquals(0, sequence.periodicLength("1010111110111110111110"))
    }

    @Test
    public void testExample() {
        assertEquals(5, sequence.periodicLength("1101111011110111101111"))
    }
}