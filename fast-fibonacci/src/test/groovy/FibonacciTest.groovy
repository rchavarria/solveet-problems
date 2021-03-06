
import static org.junit.Assert.*
import org.junit.Test
import org.junit.Before

class FibonacciTest extends GroovyTestCase {

	def fibonacci
	def n = 1000000

	@Before
	public void setUp() {
		fibonacci = new Fibonacci()
		// init methods to avoid delays
		fibonacci.iterative(0)
		fibonacci.limitedIterative(0)
		fibonacci.recursive(0)
		fibonacci.memoized(0)
		fibonacci.trampolined(0)
	}

	@Test
	public void testIterative() {
		measure ("iterative", { fibonacci.iterative(n) })
	}

	@Test
	public void testLimitedIterative() {
		measure ("limited iterative", { fibonacci.limitedIterative(n) })
	}

	@Test
	public void testMemoized() {
		measure ("memoized", { fibonacci.memoized(n) })
	}

	@Test
	public void testTrampolined() {
		measure ("trampolined", { fibonacci.trampolined(n) })
	}

	@Test
	public void testRecursive() {
		// measure ("recursive", { fibonacci.recursive(n) })
	}

	private measure(method, clojure) {
		println "Measuring '${method}'"

		def inititalTime = System.currentTimeMillis()
		def result = clojure.call()
		def finalTime = System.currentTimeMillis()

		def span = finalTime - inititalTime
		// println "Method '${method}' returns '${result}' and takes '${span}' millis to run"
		println "Method '${method}' takes '${span}' millis to run"
	}
}