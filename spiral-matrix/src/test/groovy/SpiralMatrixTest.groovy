
import static org.junit.Assert.*
import org.junit.Test
import org.junit.Before

class SpiralMatrixTest extends GroovyTestCase {
    
    def matrix

    @Before
    public void setUp() {
        matrix = new SpiralMatrix()
    }

    @Test
    public void testMatrix_3x3() {
        def actual = matrix.generate(3)
        printmatrix(actual)
        def expected = [ [1,2,3], [8,9,4], [7,6,5] ] as Object[][]
        assertEquals(expected, actual)
    }

    @Test
    public void testMatrix_4x4() {
        def actual = matrix.generate(4)
        printmatrix(actual)
        def expected = [ [1,2,3,4], [12,13,14,5], [11,16,15,6], [10,9,8,7] ] as Object[][]
        assertEquals(expected, actual)
    }

    @Test
    public void testMatrix_5x5() {
        def actual = matrix.generate(5)
        printmatrix(actual)
        def expected = [ [1,  2, 3, 4, 5], 
                         [16,17,18,19, 6], 
                         [15,24,25,20, 7], 
                         [14,23,22,21, 8],
                         [13,12,11,10, 9] ] as Object[][]
        assertEquals(expected, actual)
    }

    @Test
    public void testMatrix_6x6() {
        def actual = matrix.generate(6)
        printmatrix(actual)
        def expected = [ [1,  2, 3, 4, 5, 6], 
                         [20,21,22,23,24, 7], 
                         [19,32,33,34,25, 8], 
                         [18,31,36,35,26, 9],
                         [17,30,29,28,27,10],
                         [16,15,14,13,12,11] ] as Object[][]
        assertEquals(expected, actual)
    }

    private printmatrix(m) {
        def str = m.toString()
        str = str.replace("], ", "\n")
        str = str.replace("[", "")
        str = str.replace("]]", "\n")
        println str
    }
}