import org.scalatest.FunSuite
import scala.collection.mutable.Stack
import org.scalatest.matchers.ShouldMatchers

class CaesarTest extends FunSuite with ShouldMatchers {
    
    val caesar = new Caesar

    test("ciphering 'a' with an offset of '3' should be 'd'") {
        caesar.cipher("a", 3) should be("d")
    }

    test("deciphering 'd' with an offset of '3' should be 'a'") {
        caesar.decipher("d", 3) should be("a")
    }

    test("ciphering 'z' with an offset of '1' should be 'a'") {
        caesar.cipher("z", 1) should be("a")
    }

    test("deciphering 'a' with an offset of '1' should be 'z'") {
        caesar.decipher("a", 1) should be("z")
    }

    test("ciphering 'a' with an offset of '5' should be 'f'") {
        caesar.cipher("a", 5) should be("f")
    }

    test("deciphering 'f' with an offset of '5' should be 'a'") {
        caesar.decipher("f", 5) should be("a")
    }

    test("ciphering/deciphering with an offset of '1' should switch between 'hal' and 'ibm'") {
        caesar.cipher("hal", 1) should be("ibm")
        caesar.decipher("ibm", 1) should be("hal")
    }

    test("ciphering/deciphering out of the alphabet should return the same message") {
        caesar.cipher(".", 2) should be(".")
        caesar.decipher(".", 2) should be(".")
    }

    test("ciphering/deciphering with an offset of the dictionary's length shour return the same message") {
        caesar.cipher("bar, foo", Caesar.LENGTH) should be("bar, foo")
        caesar.decipher("foo -> bar", Caesar.LENGTH) should be("foo -> bar")
    }

    test("cipher a complete message") {
        val offset = 15
        val ciphered = caesar.cipher("foo, bar", offset)
        caesar.decipher(ciphered, offset) should be("foo, bar")
    }

}