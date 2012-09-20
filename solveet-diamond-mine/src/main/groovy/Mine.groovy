
class Mine {

	private static DIAMOND = "<>"

	def searchDiamonds(source){
		def initialLength = source.length()
		source = recursiveReplacement(source)
		return (int) ((initialLength - source.length()) / 2)
	}

	private recursiveReplacement(source){
		if(source.indexOf(DIAMOND) != -1){
			return recursiveReplacement(source.replace(DIAMOND, ""))
		}
		return source;
	}
}
