/**
 * Complete solution and tests at: https://github.com/rchavarria/solveet-problems/tree/master/loopless-route
 */
class Loopless {
    
    def undoLoops(route){
    	def south = route.count("S")
    	def north = route.count("N")
    	def east = route.count("E")
    	def west = route.count("W")

    	def vertical = buildVerticalMovement(south, north)
    	def horizontal = buildHorizontalMovement(east, west)

    	vertical + horizontal
    }

    private buildVerticalMovement(south, north) {
    	def direction = (south > north) ? "S" : "N"
    	direction * (south - north).abs()
    }

    private buildHorizontalMovement(east, west) {
    	def direction = (east > west) ? "E" : "W"
    	direction * (east - west).abs()
    }
}

// tests del enunciado
def loopless = new Loopless()
assert "" == loopless.undoLoops("")
assert "" == loopless.undoLoops("SENW")
assert "" == loopless.undoLoops("SSNN")
assert "SE" == loopless.undoLoops("SEEW")
assert "" == loopless.undoLoops("SEEESWWNNW")
// tests fuera del enunciado
assert "NN" == loopless.undoLoops("ESWWNNEEESSSWWWWNNNNEE")
assert "W" == loopless.undoLoops("SWNNESESWNNESWW")
