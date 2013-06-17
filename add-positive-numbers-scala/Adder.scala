import scala.io.Source

class Adder {

	def read(filePath: String): Int = {
		val rawLines = Source.fromFile(filePath).getLines
    	val infoLines = rawLines.drop(1)
    	val intNumbers = infoLines.map(_.toInt)
    	val positives = intNumbers.filter(_ > 0)
    	positives.fold(0)(_ + _)
	}
}