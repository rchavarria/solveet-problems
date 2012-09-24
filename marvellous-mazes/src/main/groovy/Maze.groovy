/**
 * Solucion completa y test en: https://github.com/rchavarria/solveet-problems/tree/master/marvellous-mazes
 */
class Maze {
	
	def create(filePath) {
		def lines = new File(filePath).readLines()
		def oneLine = lines.join("!")

		def nCharacters = extractNCharacters(oneLine)
		def character = extractCharacter(oneLine)

		def output = "" 
		nCharacters.times { output += character }
		output
	}

	private extractNCharacters(input) {
		input[0] as Integer
	}

	private extractCharacter(input) {
		input[1] as String
	}
}