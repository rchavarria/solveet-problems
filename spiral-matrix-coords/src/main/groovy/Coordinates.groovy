/**
 * Complete solution and tests at: https://github.com/rchavarria/solveet-problems/tree/master/spiral-matrix-coords
 */
class Coordinates {

    /**
     * n es el numero buscado
     * N es el orden de la matriz (NxN)
     */
    def compute(n, N) {
        def ring = inWichRing(n, N, 1)
        println "en una matriz $N x $N, $n esta en el anillo $ring"

        def diagonalValue = calculateDiagonalValue(N, ring)
        def lateralLength = N - (2 * ring) + 1

        // coordinates
        def x = 0
        def y = 0

        // decidir el valor de las coordenadas
        if (n <= diagonalValue + lateralLength) {            // lateral superior
            x = ring + n - diagonalValue
            y = ring

        } else if (n <= diagonalValue + 2 * lateralLength) { // lateral derecho
            x = ring + lateralLength
            y = ring + n - diagonalValue - lateralLength

        } else if (n <= diagonalValue + 3 * lateralLength) { // lateral inferior
            x = ring + diagonalValue + 3 * lateralLength - n
            y = ring + lateralLength

        } else {                                             // lateral derecho
            x = ring
            y = ring + diagonalValue + 4 * lateralLength - n
        }

        return [x, y]
    }

    /**
     * dado un número 'n', el rango de la matriz 'N' y un posible anillo,
     * retorna el anillo de la matriz en el que se encuentra 'n' comenzando
     * por '1'
     */
    private inWichRing(n, N, posibleRing) {
        def startingPoint = calculateDiagonalValue(N, posibleRing)

        // he encontrado el anillo
        if(n < startingPoint) return posibleRing - 1
        // es el último anillo posible
        else if(posibleRing >= (N / 2) + 1) return posibleRing - 1
        // sigue buscando recursivamente 
        else return inWichRing(n, N, posibleRing + 1)
    }

    // devuelve el valor de la posicion en la diagonal donde comienza el anillo 'ring'
    private calculateDiagonalValue(N, ring) {
         ((-1) * 4 * ring * ring) + 
            ((4 * N + 8) * ring) - 
            (4 * N) - 
            4 + 
            1
    }
}
