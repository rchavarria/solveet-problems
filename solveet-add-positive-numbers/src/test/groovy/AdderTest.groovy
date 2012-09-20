
import static org.junit.Assert.*
import org.junit.Before
import org.junit.Test

class TreeTest extends GroovyTestCase {

	def adder

	@Before
	void setUp(){
		adder = new Adder()
	}

    @Test
    void test() {
        assertEquals(11, adder.addPositiveNumbersInFile('src/test/resources/PositiveNumbers.txt'))
    }
}