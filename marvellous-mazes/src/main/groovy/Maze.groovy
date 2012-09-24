/**
 * Solucion completa y test en: https://github.com/rchavarria/solveet-problems/tree/master/marvellous-mazes
 */
class Maze {
	
	def create(filePath) {
		def lines = new File(filePath).readLines()
		def input = lines.join("!")

		def index = 0
		def output = "" 
		while(index < input.length()) {
			def numberOfDigits = computeNumberOfDigits(input, index)
			def nCharacters = extractNCharacters(input, index, index + numberOfDigits)
			def character = extractCharacter(input, index + numberOfDigits)
			
			// update loop counter (digits + 1 character)
			index += numberOfDigits + 1;
			println ("Input: '${input}', Number of digits: ${numberOfDigits}, nCharacters: ${nCharacters}, char: ${character}, index: ${index}")

			// create output
			nCharacters.times { output += character }
		}

		output
	}

	private computeNumberOfDigits(input, offset) {
		for(def i = offset; i < input.length(); i++) {
			def character = input[i]
			if(! character.isNumber()) {
				return i - offset;
			}
		}

		return input.length() - offset - 1;
	}

	private extractNCharacters(input, initialIndex, finalIndex) {
		def sum = 0
		input[initialIndex..finalIndex - 1].each { 
			sum += (it as Integer) 
		}
		sum
	}

	private extractCharacter(input, index) {
		input[index] as String
	}
}