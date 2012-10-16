
import static org.junit.Assert.*
import org.junit.Test
import org.junit.Before

class BarClientTest extends GroovyTestCase {
    
    def barClient

    @Before
    public void setUp() {
        barClient = new BarClient()
    }

    @Test
    public void testBarHasOneCell() {
        barClient.matrix = [["."]]
        assertTrue(barClient.existsAPathToTheBathroom())
    }

    @Test
    public void testBarHasTwoHorizontalCells() {
        barClient.matrix = [[".", "."]]
        assertTrue(barClient.existsAPathToTheBathroom())

        barClient.matrix = [["x", "."]]
        assertFalse(barClient.existsAPathToTheBathroom())
    }

    @Test
    public void testBarHasThreeHorizontalCells() {
        barClient.matrix = [[".", ".", "."]]
        assertTrue(barClient.existsAPathToTheBathroom())

        barClient.matrix = [["x", ".", "."]]
        assertFalse(barClient.existsAPathToTheBathroom())

        barClient.matrix = [[".", "x", "."]]
        assertFalse(barClient.existsAPathToTheBathroom())
    }

    @Test
    public void testBarHasTwoVerticalCells() {
        barClient.matrix = [ ["."], ["."] ]
        assertTrue(barClient.existsAPathToTheBathroom())

        barClient.matrix = [ ["."], ["x"] ]
        assertFalse(barClient.existsAPathToTheBathroom())
    }

    @Test
    public void testBarHasThreeVerticalCells() {
        barClient.matrix = [ ["."], ["."], ["."] ]
        assertTrue(barClient.existsAPathToTheBathroom())

        barClient.matrix = [ ["."], ["."], ["x"] ]
        assertFalse(barClient.existsAPathToTheBathroom())

        barClient.matrix = [ ["."], ["x"], ["."] ]
        assertFalse(barClient.existsAPathToTheBathroom())
    }

    @Test
    public void testBarIs_2x2_Cells() {
        barClient.matrix = [ [".", "."], 
                             [".", "."] ]
        assertTrue(barClient.existsAPathToTheBathroom())

        barClient.matrix = [ [".", "."], 
                             [".", "x"] ]
        assertTrue(barClient.existsAPathToTheBathroom())

        barClient.matrix = [ ["x", "."], 
                             [".", "."] ]
        assertTrue(barClient.existsAPathToTheBathroom())

        barClient.matrix = [ [".", "."], 
                             ["x", "."] ]
        assertFalse(barClient.existsAPathToTheBathroom())

        barClient.matrix = [ ["x", "."], 
                             ["x", "."] ]
        assertFalse(barClient.existsAPathToTheBathroom())

        barClient.matrix = [ [".", "."], 
                             ["x", "x"] ]
        assertFalse(barClient.existsAPathToTheBathroom())
    }

    @Test
    public void testBarIs_3x3_Cells() {
        barClient.matrix = [ [".", ".", "."], 
                             [".", ".", "."],
                             [".", ".", "."] ]
        assertTrue(barClient.existsAPathToTheBathroom())

        barClient.matrix = [ ["x", ".", "."], 
                             [".", ".", "x"],
                             [".", "x", "x"] ]
        assertTrue(barClient.existsAPathToTheBathroom())

        barClient.matrix = [ [".", "x", "."], 
                             [".", "x", "."],
                             [".", ".", "."] ]
        assertTrue(barClient.existsAPathToTheBathroom())

        barClient.matrix = [ [".", ".", "."], 
                             [".", "x", "x"],
                             [".", ".", "."] ]
        assertTrue(barClient.existsAPathToTheBathroom())

        barClient.matrix = [ [".", ".", "."], 
                             ["x", ".", "."],
                             [".", "x", "."] ]
        assertFalse(barClient.existsAPathToTheBathroom())

        barClient.matrix = [ [".", ".", "."], 
                             ["x", "x", "x"],
                             [".", ".", "."] ]
        assertFalse(barClient.existsAPathToTheBathroom())

        barClient.matrix = [ [".", "x", "."], 
                             [".", "x", "."],
                             [".", "x", "."] ]
        assertFalse(barClient.existsAPathToTheBathroom())
    }

    @Test
    public void testEndingStreet() {
        barClient.matrix = [ ["x", ".", "."], 
                             [".", "x", "."],
                             [".", ".", "."] ]
        assertTrue(barClient.existsAPathToTheBathroom())
    }

    @Test
    public void testSolveetExamples() {
        barClient.matrix = [ [".", "x", ".", ".", ".", "."], 
                             [".", ".", ".", ".", ".", "x"],
                             [".", ".", ".", "x", "x", "x"],
                             [".", ".", ".", ".", ".", "x"],
                             [".", ".", ".", "x", ".", "x"] ]
        assertTrue(barClient.existsAPathToTheBathroom())

        barClient.matrix = [ ["x", ".", ".", "."], 
                             [".", ".", "x", "x"],
                             [".", ".", ".", "x"],
                             [".", "x", ".", "x"] ]
        assertTrue(barClient.existsAPathToTheBathroom())
    }
}