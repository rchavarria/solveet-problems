package com.rchavarria.groovy.solveet

class MemoizedSimplicityEfficiency {

    def f = { x, y, z ->
        // recursive stop condition
        if(x <= y) return y
        
        f.call(
            f.call(x-1, y, z),
            f.call(y-1, z, x),
            f.call(z-1, x, y) )
    }.memoize()
    
}
