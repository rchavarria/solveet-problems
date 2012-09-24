/**
 * Solucion completa y test en: https://github.com/rchavarria/solveet-problems/tree/master/marvellous-mazes
 */
class Maze {
	
	def create(filePath) {
		def lines = new File(filePath).readLines()
		def oneLine = lines.join("!")

		def numberOfDigits = computeNumberOfDigits(oneLine, 0)
		def nCharacters = extractNCharacters(oneLine, 0 , numberOfDigits)
		def character = extractCharacter(oneLine, numberOfDigits + 1)

		def output = "" 
		nCharacters.times { output += character }
		output
	}

	private computeNumberOfDigits(input, offset) {
		for(def i = offset; i < input.length(); i++) {
			def character = input[i]
			if(! character.isNumber()) {
				return i - offset - 1;
			}
		}

		return input.length() - offset;
	}

	private extractNCharacters(input, initialIndex, finalIndex) {
		def sum = 0
		input[initialIndex..finalIndex].each { sum += it as Integer }
		sum
	}

	private extractCharacter(input, index) {
		input[index] as String
	}
}