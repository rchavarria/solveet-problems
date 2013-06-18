/*
 *  Complete solution and tests can be found at:
 * https://github.com/rchavarria/solveet-problems/tree/master/add-positive-numbers-scala
 */
import scala.io.Source

class Adder {

    def read(filePath: String): Int = {
        Source.fromFile(filePath)
              .getLines         // read all lines
              .drop(1)          // ignore first one
              .map(_.toInt)     // cast every line to integer
              .filter(_ > 0)    // get only positive ones
              .sum              // sum up
    }
}