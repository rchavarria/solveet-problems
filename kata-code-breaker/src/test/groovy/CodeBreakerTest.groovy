
import static org.junit.Assert.*
import org.junit.Test
import org.junit.Before

class CodeBreakerTest extends GroovyTestCase {
    
    def breaker

    @Before
    public void setUp() {
        breaker = new CodeBreaker(code: "RAMV")
    }

    @Test
    public void testZeroMatches() {
        def breaker = new CodeBreaker(code: "R")
        assertEquals("", breaker.unlock("I"))
    }

    @Test
    public void testLenghtOnePasswordMatchesDigitAndPosition() {
        def breaker = new CodeBreaker(code: "R")
        assertEquals("*", breaker.unlock("R"))
    }

    @Test
    public void testLenghtTwoPasswordMatchesDigitAndPosition() {
        def breaker = new CodeBreaker(code: "RR")
        assertEquals("**", breaker.unlock("RR"))
    }

    @Test
    public void testLenghtTwoPasswordMatchesOnlyFirstPosition() {
        def breaker = new CodeBreaker(code: "RA")
        assertEquals("*", breaker.unlock("RI"))
    }

    @Test
    public void testLenghtTwoPasswordMatchesOnlySecondPosition() {
        def breaker = new CodeBreaker(code: "RA")
        assertEquals("*", breaker.unlock("IA"))
    }

    @Test
    public void testLenghtTwoPasswordMatchesOnlyFirstDigit() {
        def breaker = new CodeBreaker(code: "RA")
        assertEquals("N", breaker.unlock("IR"))
    }
    
    @Test
    public void testLenghtTwoPasswordMatchesOnlySecondDigit() {
        def breaker = new CodeBreaker(code: "RA")
        assertEquals("N", breaker.unlock("AI"))
    }

    @Test
    public void testLenghtThreePasswordMatchesFirstPosition() {
        def breaker = new CodeBreaker(code: "RAM")
        assertEquals("*", breaker.unlock("RII"))
    }

    @Test
    public void testLenghtThreePasswordMatchesFirstAndSecondPosition() {
        def breaker = new CodeBreaker(code: "RAM")
        assertEquals("**", breaker.unlock("RAI"))
    }

    @Test
    public void testLenghtThreePasswordMatchesFirstDigit() {
        def breaker = new CodeBreaker(code: "RAM")
        assertEquals("N", breaker.unlock("IIR"))
        assertEquals("N", breaker.unlock("IRI"))
    }

    @Test
    public void testLenghtThreePasswordMatchesFirstAndSecondDigit() {
        def breaker = new CodeBreaker(code: "RAM")
        assertEquals("NN", breaker.unlock("IRA"))
        assertEquals("NN", breaker.unlock("ARI"))
    }

    @Test
    public void testLenghtThreePasswordMatchesFirstSecondAndThirdDigit() {
        def breaker = new CodeBreaker(code: "RAM")
        assertEquals("NNN", breaker.unlock("MRA"))
        assertEquals("NNN", breaker.unlock("AMR"))
    }

    @Test
    public void testLenghtThreePasswordMatchesFirstPositionAndSecondDigit() {
        def breaker = new CodeBreaker(code: "RAM")
        assertEquals("N*", breaker.unlock("RIA"))
    }

    @Test
    public void testMultipleResults() {
        assertEquals("NN**", new CodeBreaker(code: "RAMV").unlock("RAVM"))
        assertEquals("NN**", new CodeBreaker(code: "AAII").unlock("AIAI"))
        assertEquals("*", new CodeBreaker(code: "INVM").unlock("IAAR"))
    }

    @Test
    public void testPlay() {
        new CodeBreaker().play()
    }

}