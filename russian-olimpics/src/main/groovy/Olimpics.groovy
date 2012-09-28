/**
 * Solucion completa y test en: https://github.com/rchavarria/solveet-problems/tree/master/russian-olimpics
 */
class Olimpics {
	
    def bruteForce(n) {
        def digits = ""
        def i = 0
        while(digits.length() < n) {
            i++
            digits += i.toString()
        }
        
        digits[n - 1] as Integer
    }
    
    def withoutGeneratingString(n) {
        if(n < 10) return n
        
        def digits = 9
        def counter = 9
        while(true) {
            counter++
        	def futureDigits = digits + counter.toString().length()
        	if(futureDigits >= n) break
        	digits = futureDigits
        }

        counter.toString()[n - digits - 1] as Integer
    }
}