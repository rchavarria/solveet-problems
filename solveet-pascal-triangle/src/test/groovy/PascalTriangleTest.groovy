
import static org.junit.Assert.*
import org.junit.Test
import org.junit.Before

class PascalTriangleTest extends GroovyTestCase {

    private triangle
    
    @Before
    public void setUp() {
        triangle = new PascalTriangle()
    }
    
    @Test
    public void testOneRow() {
        def pascal = triangle.generate(1)
        def expected = [[1]]
        assertEquals(expected, pascal)
        printTriangle(expected)
    }
    
    @Test
    public void testTwoRows() {
        def pascal = triangle.generate(2)
        def expected = [[1], [1, 1]]
        assertEquals(expected, pascal)
        printTriangle(expected)
    }
    
    @Test
    public void testThreeRows() {
        def pascal = triangle.generate(3)
        def expected = [ [1], [1, 1], [1, 2, 1] ]
        assertEquals(expected, pascal)
        printTriangle(expected)
    }
    
    @Test
    public void testTenRows() {
        def pascal = triangle.generate(10)
        def expected = [ [1], [1,1], [1,2,1], [1,3,3,1], [1,4,6,4,1], [1,5,10,10,5,1], [1,6,15,20,15,6,1], [1,7,21,35,35,21,7,1], [1,8,28,56,70,56,28,8,1], [1,9,36,84,126,126,84,36,9,1]]
        assertEquals(expected, pascal)
        printTriangle(expected)
    }
    
    private printTriangle(def result){
        println result.toString()
                      .replace("],", "\n")
                      .replace("[", "")
                      .replace("]", "")
                      .replace(" ", "")
        println ""
    }
}