import org.specs2.mutable._

class BestBeforeSpec extends Specification {

  "Best before method" should {
    val eat = new BestBefore

    "return '1st January 2001' when it is called with '1/1/1'" in {
      eat.bestBefore("1/1/1") must be equalTo( (1, "January", 2001) )
    }

    "return '3rd February 2001' when it is called with '1/2/3'" in {
      eat.bestBefore("1/2/3") must be equalTo( (3, "February", 2001) )
    }
  }
}
