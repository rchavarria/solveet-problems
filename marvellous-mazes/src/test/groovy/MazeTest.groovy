
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

	@Test
	public void testInput_11T_Outputs_TT() {
		check("src/test/resources/11T.txt", "TT")
	}

	@Test
	public void testInput_1T1T_Outputs_TT() {
		check("src/test/resources/1T1T.txt", "TT")
	}

	@Test
	public void testInput_1T1b_Outputs_T_() {
		check("src/test/resources/1T1b.txt", "T ")
	}

	@Test
	public void testInputContainsSeveralLines() {
		check("src/test/resources/several_lines.txt", "T\nT")
	}

	@Test
	public void testInputContainsAnExclamationCharacter() {
		check("src/test/resources/exclamation.txt", "T\nT")
	}

	@Test
	public void testInputContainsSeveralMazes() {
		check("src/test/resources/several_mazes.txt", "T T\nTTT\n\nT T\nTTT")
	}

	private check(inputFilePath, expectedOutput) {
		def actualOutput = maze.create(inputFilePath)
		assertEquals(expectedOutput, actualOutput)
	}
}