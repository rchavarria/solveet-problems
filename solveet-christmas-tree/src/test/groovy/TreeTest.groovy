
import static org.junit.Assert.*
import org.junit.Before
import org.junit.Test

class TreeTest extends GroovyTestCase {

	def tree

	@Before
	void setUp(){
		tree = new Tree()
	}

    @Test
    void testLevelOne() {
        def expected = "*"
        def actualTree = tree.print(1)
        
        assertEquals(expected, actualTree)
    }

    @Test
    void testLevelTwo() {
        def expected = " * " + "\n" +
                       "***"
        def actualTree = tree.print(2)

        print "actualTree: \n${actualTree}\n"
        assertEquals(expected, actualTree)
    }

    @Test
    void testLevelThree() {
        def expected = "  *  " + "\n" +
                       " *** " + "\n" +
                       "*****"
        def actualTree = tree.print(3)
        print "actualTree: \n${actualTree}\n"
		assertEquals(expected, actualTree)
    }
}