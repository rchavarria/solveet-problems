/**
 * Complete solution and tests at: https://github.com/rchavarria/solveet-problems/tree/master/binary-sum
 */
class BinarySum {
    
    /**
     * por la fuerza bruta
     */
    def bruteForce(n){
        def max = 0
        def result = [1, 0]

        for(def left = 1; left < (n / 2) + 1; left++) {
            def right = n - left

            def numberOfOnes = Integer.toBinaryString(left).count("1") +
                               Integer.toBinaryString(right).count("1")

            if (numberOfOnes > max) {
                max = numberOfOnes
                result = [left, right]
            }
        }

        return result
    }

    /**
     * usando el método de santanor para implementar una solución más eficiente
     */
    def usingPowersOfTwo(n) {
        if (n == 1) return [1, 0]

        def powerOfTwoLessOne = greaterPowerOfTwoLessThan(n) - 1
        def result = [powerOfTwoLessOne, n - powerOfTwoLessOne]

        // primero el pequeño
        [result.min(), result.max()]
    }

    // retorna la potencia de 2 mas grande inmediatamente inferior a 'n'
    private greaterPowerOfTwoLessThan(n) {
        if (n == 2) return 2

        def power = 2
        while(n > power) power = power << 1 

        power >> 1
    }
}
