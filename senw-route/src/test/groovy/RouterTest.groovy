
import static org.junit.Assert.*
import org.junit.Test
import org.junit.Before

class RouterTest extends GroovyTestCase {
	
	def router

	@Before
	public void setUp() {
		router = new Router()
	}

	@Test
	public void testFirst() {
		router.follow(null, null)
	}

}