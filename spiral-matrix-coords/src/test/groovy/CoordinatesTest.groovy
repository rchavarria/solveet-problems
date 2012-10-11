
import static org.junit.Assert.*
import org.junit.Test
import org.junit.Before

class CoordinatesTest extends GroovyTestCase {
    
    def coords

    @Before
    public void setUp() {
        coords = new Coordinates()
    }

    @Test
    public void testMatrix_3x3() {
        assertEquals( [1, 1], coords.compute(1, 3) )
        assertEquals( [2, 1], coords.compute(2, 3) )
        assertEquals( [3, 1], coords.compute(3, 3) )
        assertEquals( [3, 2], coords.compute(4, 3) )
        assertEquals( [3, 3], coords.compute(5, 3) )
        assertEquals( [2, 3], coords.compute(6, 3) )
        assertEquals( [1, 3], coords.compute(7, 3) )
        assertEquals( [1, 2], coords.compute(8, 3) )
        assertEquals( [2, 2], coords.compute(9, 3) )
    }

    @Test
    public void testMatrix_4x4() {
        assertEquals( [1, 1], coords.compute(1, 4) )
        assertEquals( [2, 1], coords.compute(2, 4) )
        assertEquals( [3, 1], coords.compute(3, 4) )
        assertEquals( [4, 1], coords.compute(4, 4) )
        assertEquals( [4, 2], coords.compute(5, 4) )
        assertEquals( [4, 3], coords.compute(6, 4) )
        assertEquals( [4, 4], coords.compute(7, 4) )
        assertEquals( [3, 4], coords.compute(8, 4) )
        assertEquals( [2, 4], coords.compute(9, 4) )
        assertEquals( [1, 4], coords.compute(10, 4) )
        assertEquals( [1, 3], coords.compute(11, 4) )
        assertEquals( [1, 2], coords.compute(12, 4) )
        assertEquals( [2, 2], coords.compute(13, 4) )
        assertEquals( [3, 2], coords.compute(14, 4) )
        assertEquals( [3, 3], coords.compute(15, 4) )
        assertEquals( [2, 3], coords.compute(16, 4) )
    }

    @Test
    public void testMatrix_7x7() {
        assertEquals( [1, 1], coords.compute(1, 7) )
        assertEquals( [2, 2], coords.compute(25, 7) )
    }
}