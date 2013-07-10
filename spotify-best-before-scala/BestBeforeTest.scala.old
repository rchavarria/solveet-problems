import org.scalatest.FunSuite
import scala.collection.mutable.Stack
import org.scalatest.matchers.ShouldMatchers

class BestBeforeTest extends FunSuite with ShouldMatchers {
    
    val eat = new BestBefore

    test("best before '1/1/1' should be '1st January 2001'") {
        eat.bestBefore("1/1/1") should be( (1, "January", 2001) )
    }

    test("best before '2/3/1' should be '3rd February 2001'") {
        eat.bestBefore("2/3/1") should be( (3, "February", 2001) )
    }

}