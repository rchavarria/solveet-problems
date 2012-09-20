
class Adder {

	def addPositiveNumbersInFile(filePath){
		new File(filePath).readLines()[1..-1].collect { it.toInteger() }.findAll { it > 0 }.inject(0) { sum, i -> sum + i }

		/*

		def lines = new File(filePath).readLines()
		println "lineas: ${lines.size()}"

		def numbers = lines[1..-1].collect { it.toInteger() }
		println "numbers: ${numbers}"

		def positives = numbers.findAll { it.toInteger() > 0 }
		println "positives: ${positives}"

		def total = positives.inject(0) {sum, i -> sum + i.toInteger()}
		return total
		
		*/
	}
}
