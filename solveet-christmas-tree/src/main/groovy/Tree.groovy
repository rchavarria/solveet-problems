
class Tree {

	def print(levels){
		def tree = (1..levels).collect { currentLevel ->
			generateLevel(currentLevel).center(levels * 2 - 1)
		}.join("\n")

		return tree.substring(0, tree.length())
	}

	private generateLevel(currentLevel){
		"*" * ((currentLevel * 2) - 1)
	}
}
