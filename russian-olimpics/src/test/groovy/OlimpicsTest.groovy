
import static org.junit.Assert.*
import org.junit.Test
import org.junit.Before

class OlimpicsTest extends GroovyTestCase {

	def olimpics

	@Before
	public void setUp() {
		olimpics = new Olimpics()
	}

	@Test
	public void testBruteForce() {
		assertEquals(1, olimpics.bruteForce(1))
		assertEquals(2, olimpics.bruteForce(2))
		assertEquals(3, olimpics.bruteForce(3))
		assertEquals(4, olimpics.bruteForce(4))
		assertEquals(5, olimpics.bruteForce(5))
		assertEquals(6, olimpics.bruteForce(6))
		assertEquals(7, olimpics.bruteForce(7))
		assertEquals(8, olimpics.bruteForce(8))
		assertEquals(9, olimpics.bruteForce(9))

		assertEquals(1, olimpics.bruteForce(10))
		assertEquals(0, olimpics.bruteForce(11))
		assertEquals(7, olimpics.bruteForce(206788))
	}

	@Test
	public void testWithoutGeneratingString() {
		assertEquals(1, olimpics.withoutGeneratingString(1))
		assertEquals(2, olimpics.withoutGeneratingString(2))
		assertEquals(3, olimpics.withoutGeneratingString(3))
		assertEquals(4, olimpics.withoutGeneratingString(4))
		assertEquals(5, olimpics.withoutGeneratingString(5))
		assertEquals(6, olimpics.withoutGeneratingString(6))
		assertEquals(7, olimpics.withoutGeneratingString(7))
		assertEquals(8, olimpics.withoutGeneratingString(8))
		assertEquals(9, olimpics.withoutGeneratingString(9))

		assertEquals(1, olimpics.withoutGeneratingString(10))
		assertEquals(0, olimpics.withoutGeneratingString(11))
		assertEquals(7, olimpics.withoutGeneratingString(206788))
	}

	@Test
	public void testBothMethodsReturnTheSame() {
		(1..1000).each { n ->
			assertEquals(olimpics.bruteForce(n), olimpics.withoutGeneratingString(n))
		}
	}
}