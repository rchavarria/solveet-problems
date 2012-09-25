
import static org.junit.Assert.*
import org.junit.Test
import org.junit.Before

class FibonacciTest extends GroovyTestCase {

	def fib
	def n = 100

	@Before
	public void setUp() {
		fib = new Fibonacci()
	}

	@Test
	public void testRecursive() {
		measure ("recursive", { fib.recursive(n) })
	}

	private measure(method, clojure) {
		println "Measuring '${method}'"

		def inititalTime = System.currentTimeMillis()
		clojure.call()
		def finalTime = System.currentTimeMillis()

		def span = finalTime - inititalTime
		println "Method '${method}' takes '${span}' millis to run"
	}
}