
import static org.junit.Assert.*
import org.junit.Test
import org.junit.Before

class MazeTest extends GroovyTestCase {

	def maze

	@Before
	public void setUp() {
		maze = new Maze()
	}

	@Test
	public void testInput_1T_Outputs_T() {
		def output = maze.create("src/test/resources/1T.txt")
		def expected = "T"
		assertEquals(expected, output)
	}

	@Test
	public void testInput_5T_Outputs_TTTTT() {
		def output = maze.create("src/test/resources/5T.txt")
		def expected = "TTTTT"
		assertEquals(expected, output)
	}
}