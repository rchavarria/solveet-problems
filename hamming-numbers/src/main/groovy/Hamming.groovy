/**
 * Complete solution and tests at: https://github.com/rchavarria/solveet-problems/tree/master/hamming-numbers
 */
class Hamming {
    
    def generate(n){
        def sucession = [1]

        for(def i = 0; i < n; i++) {
            sucession << sucession[i] * 2
            sucession << sucession[i] * 3
            sucession << sucession[i] * 5
            sucession = sucession.unique()
        }

        sucession.sort()[0..(n - 1)]
    }
}