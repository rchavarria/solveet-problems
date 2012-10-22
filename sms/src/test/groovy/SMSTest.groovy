
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
    public void testEmptyString() {
        assertEquals("", sms.translate(""))
    }

    @Test
    public void testOneDigit() {
        assertEquals("-", sms.translate("0"))
    }

    @Test
    public void testTwoDigits() {
        assertEquals(";", sms.translate("11"))
    }

    @Test
    public void testThreeDigits() {
        assertEquals("c", sms.translate("222"))
    }

    @Test
    public void testFourDigits() {
        assertEquals("3", sms.translate("3333"))
    }

    @Test
    public void testExceedingDigits() {
        assertEquals("m", sms.translate("6"))
        assertEquals("m", sms.translate("66666"))
    }

    @Test
    public void testDifferentDigitsWithoutSeparation() {
        assertEquals("ma", sms.translate("62"))
        assertEquals("mama", sms.translate("6262"))
    }

    @Test
    public void testSameDigitsWithSeparation() {
        assertEquals("ca", sms.translate("222 2"))
        assertEquals("caca", sms.translate("222 2 222 2"))
    }

    @Test
    public void testDifferentDigitsWithSeparation() {
        assertEquals("ma", sms.translate("6 2"))
        assertEquals("mama", sms.translate("6 2 6 2"))
        assertEquals("mama", sms.translate("6 26 2"))
    }
}