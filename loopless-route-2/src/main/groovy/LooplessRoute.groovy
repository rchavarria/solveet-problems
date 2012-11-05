/**
 * Complete solution and tests at: https://github.com/rchavarria/solveet-problems/tree/master/loopless-route-2
 */
class LooplessRoute {

    def makeItLoopless(path) {
        def firstStep = [point: [0, 0], movement: ""]
        def steps = [ firstStep ]

        path.each { goesTo ->
            def step = nextStep(steps[-1], goesTo)
            def idx = steps.findIndexOf {
                it["point"] == step["point"]
            }
            
            if (idx >= 0) {
                def steps_idx = steps[idx]
                steps = steps[0..idx]
            } else {
                steps << step
            }
        }

        steps.inject("") { str, step -> str += step["movement"] }
    }

    private nextStep(step, goesTo) {
        [ point: nextPoint(step["point"], goesTo), 
          movement: goesTo ]
    }

    private nextPoint(point, goesTo) {
        switch(goesTo) {
            case "E": return [ point[0] + 1, point[1] ]
            case "W": return [ point[0] - 1, point[1] ]
            case "S": return [ point[0], point[1] + 1 ]
            case "N": return [ point[0], point[1] - 1 ]
        }
    }

}

// Showing how to use the class
/*
def route = new LooplessRoute()
assert("", route.makeItLoopless("SENW"))
assert("", route.makeItLoopless("SSNN"))
assert("SE", route.makeItLoopless("SEEW"))
assert("", route.makeItLoopless("SEEESWWNNW"))
 */
