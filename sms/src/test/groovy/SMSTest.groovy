
import static org.junit.Assert.*
import org.junit.Test
import org.junit.Before

class SMSTest extends GroovyTestCase {
    
    def sms

    @Before
    public void setUp() {
        sms = new SMS()
    }

    @Test
    public void test() {
        assertEquals("", sms.translate(""))
    }
}