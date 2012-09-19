package com.rchavarria.groovy.solveet

class SimplicityEfficiency {

    def f(x, y, z) {
        // recursive stop condition
        if(x <= y) return y
        
        f(
            f(x-1, y, z),
            f(y-1, z, x),
            f(z-1, x, y) )
    }
    
}
