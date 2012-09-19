package com.rchavarria.groovy.solveet

class ClosureZSimplicityEfficiency {

    def k(n) {
        def returnedClosure = { return n }
        return returnedClosure
    }
    
    def f = { x, y, z ->
        if(x <= y) {
            return y
        }
        
        def zValue = z()
            
        return f(
            f(x-1, y, z),
            f(y-1, zValue, k(x)),
            { return f(zValue-1, x, k(y)) } )
    }
    
}
