
class PrimeFactors {

    def generate(int n) {
        def factors = []
        def candidate = 2

        while(candidate <= n){
            if(candidateIsFactor(candidate, n)){
                factors << candidate
                n /= candidate
            } else {
                candidate++
            }
        }
        
        if(n > 1){
            factors << n
        }
        
        return factors
    }
    
    private candidateIsFactor(def candidate, def n){
        return (n % candidate == 0)
    }
}
