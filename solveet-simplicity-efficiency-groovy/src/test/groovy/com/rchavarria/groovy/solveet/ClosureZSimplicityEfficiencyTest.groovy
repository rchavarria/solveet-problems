package com.rchavarria.groovy.solveet;

import static org.junit.Assert.*;

import org.junit.Test;

class ClosureZSimplicityEfficiencyTest {

    @Test
    void testF() {
        def sut = new ClosureZSimplicityEfficiency()
        
        def n = 1;
        def initTime = 0L
        def endTime = 0L
        
        while((endTime - initTime) < 1000 || n > 2000){
            
            initTime = System.currentTimeMillis()
            def f = sut.f( n, 0, sut.k(n+1) )
            endTime = System.currentTimeMillis()
            
            println "f(${n}, 0, ${n+1}) = ${f}, ${endTime - initTime}"
            n++
        }
        
        println "Efficiency: ${n - 1}"
    }

}
