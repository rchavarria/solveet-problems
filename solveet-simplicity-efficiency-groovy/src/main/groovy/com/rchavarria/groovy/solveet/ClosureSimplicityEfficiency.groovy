package com.rchavarria.groovy.solveet

class ClosureSimplicityEfficiency {

    def k(n) {
        def returnedClosure = { return n }
        return returnedClosure
    }
    
    def f = { x, y, z ->
        def xValue = x()
        def yValue = y()
        
        // recursive stop condition
        if(xValue <= yValue) {
            return yValue
        }
            
        def lazyX = k(xValue)
        def lazyY = k(yValue)
        
        return f(
            { return f(k(xValue-1), lazyY, z) },
            { return f(k(yValue-1), z, lazyX) },
            { return f(k(z()-1), lazyX, lazyY) } )
    }
    
}
