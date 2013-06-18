import org.scalatest.FunSuite
import scala.collection.mutable.Stack
import org.scalatest.matchers.ShouldMatchers

class AdderTest extends FunSuite with ShouldMatchers {

    test("Reading a file without numbers returns zero") {
        val adder = new Adder
        val sum = adder.read("files/zeroNumbers.txt")
        sum should be(0)
    }

    test("Reading a file with 1 positive number returns that number") {
        val adder = new Adder
        val sum = adder.read("files/onePositiveNumber.txt")
        sum should be(1234)
    }

    test("Reading a file with 1 negative number returns zero") {
        val adder = new Adder
        val sum = adder.read("files/oneNegativeNumber.txt")
        sum should be(0)
    }

    test("Reading a file with positive and negative numbers solves the problem") {
        val adder = new Adder
        val sum = adder.read("files/mixed.txt")
        sum should be(37)
    }

}
