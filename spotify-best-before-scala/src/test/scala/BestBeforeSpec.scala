import org.specs2.mutable._

class BestBeforeSpec extends Specification {

  args.execute(sequential = true)

  "Best before method" should {
    val eat = new BestBefore

    "return '1st January 2001' when it is called with '1/1/1'" in {
      eat.bestBefore("1/1/1") must be equalTo( (1, "January", 2001) )
    }

    "return '3rd February 2001' when it is called with '1/2/3'" in {
      eat.bestBefore("1/2/3") must be equalTo( (3, "February", 2001) )
    }

    "return '4th February 2067' when it is called with '2/4/67'" in {
      eat.bestBefore("2/4/67") must be equalTo( (4, "February", 2067) )
    }

    "return '13rd May 2032' when it is called with '5/32/13'" in {
      eat.bestBefore("5/32/13") must be equalTo( (13, "May", 2032) )
    }

    "throw an exception when it is called with '31/9/73'" in {
      eat.bestBefore("31/9/73") must throwAn[Exception]
    }
  }
}
