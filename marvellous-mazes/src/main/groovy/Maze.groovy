/**
 * Solucion completa y test en: https://github.com/rchavarria/solveet-problems/tree/master/marvellous-mazes
 */
class Maze {
	
	def create(filePath) {
		def lines = new File(filePath).readLines()
		def input = lines.join("!") // join lines, ! means a new line in the output
		println "input ${input}"

		def index = 0
		def output = "" 
		while(index < input.length()) {
			// new line?
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
		def lastIndex = input.length() - 1
		(input[offset..lastIndex] as List).findIndexOf { !it.isNumber() }
	}

	private extractNCharacters(input, initialIndex, finalIndex) {
		(input[initialIndex..finalIndex] as List).inject(0) { count, item -> 
			count + (item as Integer)
		}
	}

	private extractCharacter(input, index) {
		def character = input[index] as String
		return (character == "b") ? " " : character
	}
}