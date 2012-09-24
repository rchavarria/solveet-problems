/**
 * Solucion completa y test en: https://github.com/rchavarria/solveet-problems/tree/master/marvellous-mazes
 */
class Maze {
	
	def create(filePath) {
		def lines = new File(filePath).readLines()
		def input = lines.join("!")
		println "input ${input}"

		def index = 0
		def output = "" 
		while(index < input.length()) {
			if(isNewLine(input, index)) {
				output += "\n"
				index++
				continue
			}

			def numberOfDigits = computeNumberOfDigits(input, index)
			def nCharacters = extractNCharacters(input, index, index + numberOfDigits - 1)
			def character = extractCharacter(input, index + numberOfDigits)
			
			// update loop counter (digits + 1 character)
			index += numberOfDigits + 1;
			// println ("Input: '${input}', Number of digits: ${numberOfDigits}, nCharacters: ${nCharacters}, char: ${character}, index: ${index}")

			// create output
			nCharacters.times { output += character }
		}

		println "output\n${output}"
		output
	}

	private isNewLine(input, index) {
		input[index] == "!"
	}

	private computeNumberOfDigits(input, offset) {
		for(def i = offset; i < input.length(); i++) {
			def character = input[i]
			if(! character.isNumber()) {
				return i - offset;
			}
		}

		throw RuntimeException("the input can not end with a number")
	}

	private extractNCharacters(input, initialIndex, finalIndex) {
		def sum = 0
		input[initialIndex..finalIndex].each { 
			sum += (it as Integer) 
		}
		sum
	}

	private extractCharacter(input, index) {
		def character = input[index] as String
		return (character == "b") ? " " : character
	}
}