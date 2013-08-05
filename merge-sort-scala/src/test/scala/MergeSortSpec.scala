import org.specs2.mutable._

class MergeSortSpec extends Specification {

  args.execute(sequential = true)
  val solveet = new MergeSort

  "Merge sort algorith" should {

    "sort empty list" in {
      solveet.sort(List()) must be equalTo(List())
    }

    "sort a list of one item" in {
      solveet.sort(List(1)) must be equalTo(List(1))
    }

    "sort a list of two items" in {
      solveet.sort(List(2, 1)) must be equalTo(List(1, 2))
    }

    "sort a list of three items" in {
      solveet.sort(List(2, 3, 1)) must be equalTo(List(1, 2, 3))
    }

  }

}
