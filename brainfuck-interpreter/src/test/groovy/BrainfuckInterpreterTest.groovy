
import static org.junit.Assert.*
import org.junit.Test
import org.junit.Before

class BrainfuckInterpreterTest extends GroovyTestCase {
    
    def interpreter

    @Before
    public void setUp() {
        interpreter = new BrainfuckInterpreter()
    }

    @Test
    public void testPrintCurrentCellValue() {
        def output = interpreter.execute(".")

        assertEquals([(char) 0], output)
    }

    @Test
    public void testIncrementAndPrint() {
        def output = interpreter.execute("++.")
        def expected = [(char) 2]
        assertEquals(expected, output)
    }

    @Test
    public void testDecrement() {
        def output = interpreter.execute("+"*5 + "-.")
        def expected = [(char) 4]
        assertEquals(expected, output)
    }

    @Test
    public void testMoveForward() {
        def output = interpreter.execute("+"*10 + ".>" + "+"*2 + ".")
        def expected = [(char) 10, (char) 2]
        assertEquals(expected, output)
    }

    @Test
    public void testMoveBackward() {
        def output = interpreter.execute("+++>++<.>.")
        def expected = [(char) 3, (char) 2]
        assertEquals(expected, output)
    }

    @Test
    public void testReadFromInput() {
        def output = interpreter.execute(",+.", "1")
        
        // char expectedChar = "1" as char
        // int expectedInt = (int) expectedChar
        // println "cuanto vale 1: '${expectedInt}'"
        
        def expected = [(char) 50]
        assertEquals(expected, output)
    }

    @Test
    public void testJumpIfCellIsCero() {
        def output = interpreter.execute("+-[+].")
        // skip the second '+'
        def expected = [(char) 0]
        assertEquals(expected, output)
    }

    @Test
    public void testDontJumpIfCellIsNotCero() {
        def output = interpreter.execute("+[-].")
        def expected = [(char) 0]
        assertEquals(expected, output)
    }

    @Test
    public void testJumpBackwards() {
        // loop 5 times, decrement 5 times, then end loop
        def output = interpreter.execute("+++++[-].")
        def expected = [(char) 0]
        assertEquals(expected, output)
    }
    @Test
    public void testSolveet() {
        def code = "++++++++++[>+++++++>++++++++++>+++>+<<<<-]" +
                   ">++.>+.+++++++..+++.>++.<<+++++++++++++++." +
                   ">.+++.------.--------.>+.>."
        def output = interpreter.execute(code)
        def current = output.join("");
        def expected = "Hello World!\n"

        assertEquals(expected, current)
    }
}