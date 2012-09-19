package com.rchavarria.groovy.solveet;

import static org.junit.Assert.*;

import org.junit.Test;

class MemoizedSimplicityEfficiencyTest {

    @Test
    void testF() {
        def sut = new MemoizedSimplicityEfficiency()
        
        def n = 1;
        def initTime = 0L
        def endTime = 0L
        
        while((endTime - initTime) < 1000){
            
            initTime = System.currentTimeMillis()
            def f = sut.f.call(n, 0, n+1)
            endTime = System.currentTimeMillis()
            
            println "f(${n}, 0, ${n+1}) = ${f}, ${endTime - initTime}"
            n++
        }
        
        println "Memoized efficiency: ${n - 1}"
    }

}
