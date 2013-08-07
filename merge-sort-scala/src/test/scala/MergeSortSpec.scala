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

    "sort a list of more than three items" in {
      solveet.sort(List(2, 3, 1, 4)) must be equalTo(List(1, 2, 3, 4))
      solveet.sort(List(2, 3, 5, 1, 4)) must be equalTo(List(1, 2, 3, 4, 5))
      solveet.sort(List(2, 5, 6, 3, 1, 4)) must be equalTo(List(1, 2, 3, 4, 5, 6))
      solveet.sort(List(6, 5, 2, 3, 10, 8, 1, 9, 7, 4)) must be equalTo(List(1, 2, 3, 4, 5, 6, 7, 8, 9, 10))
      solveet.sort(List(11, 10, 9, 8, 2, 3, 5, 6, 7, 1, 4)) must be equalTo(List(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11))
    }

  }

}
