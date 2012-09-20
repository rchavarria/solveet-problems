
class TwinPrimes {

    def areTwin(def n, def m){
        if(m - n != 2)
            return false
        
        return isPrime(n) && isPrime(m)
    }
    
    private isPrime(def n) {
        def candidate = 1
        
        while(++candidate != n)
            if(n % candidate == 0) 
                return false
        
        return true
    }
}
