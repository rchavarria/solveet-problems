/**
 * Complete solution and tests at: https://github.com/rchavarria/solveet-problems/tree/master/hamming-numbers
 */
class FunctionalHamming {
    
    static {
        Number.metaClass.isHamming {
            def n = (delegate as Integer)
            [2, 3, 5].each { while(n % it == 0)  { n = (n / it) as Integer }  }
            n == 1
        }
    }

    def generate(n) {
        def sucession = (1..2*n).findAll { it.isHamming() }
        sucession.sort()[0..(n - 1)]
    }
}