
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
		check("src/test/resources/1T.txt", "T")
	}

	@Test
	public void testInput_5T_Outputs_TTTTT() {
		check("src/test/resources/5T.txt", "TTTTT")
	}

	private check(inputFilePath, expectedOutput) {
		def actualOutput = maze.create(inputFilePath)
		assertEquals(expectedOutput, actualOutput)
	}
}