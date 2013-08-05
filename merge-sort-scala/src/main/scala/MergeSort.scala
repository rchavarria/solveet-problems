
/*
 *  Complete solution and tests can be found at:
 *      https://github.com/rchavarria/solveet-problems/tree/master/merge-sort-scala
 */
class MergeSort {

    def sort(numbers: List[Int]): List[Int] = {
    	val n = numbers.size
    	if(n <= 1) return numbers

    	val (lowerHalf, upperHalf) = numbers splitAt n/2 
    	merge( sort(lowerHalf), sort(upperHalf))
    }

    private def merge(left: List[Int], right: List[Int]): List[Int] = {
    	val values = left ::: right
    	List(values.min, values.max)
    }
}
