/**
 * Complete solution and tests at: https://github.com/rchavarria/solveet-problems/tree/master/spiral-matrix
 */
class SpiralMatrix {

    // coordinates
    private x = 0
    private y = 0
    // offset in coordinates, to move between rings
    private offsetX = 0
    private offsetY = 0
    // side: top, right, bottom, left
    private side = "top"
    // side length, it depends on the ring you're moving
    private sideLength

    def generate(N) {
        def matrix = new Object[N][N]
        def sidePosition = 0
        
        sideLength = N - 1

        for (def n = 1; n <= N**2; n++) {
            matrix[offsetY + y][offsetX + x] = n
            nextCoordinates()
            sidePosition = nextSidePosition(sidePosition)
        }

        return matrix
    }

    private nextCoordinates() {
        if("top" == side) x++
        else if("right" == side) y++
        else if("bottom" == side) x--
        else if("left" == side) y--
    }

    private nextSidePosition(sidePosition) {
        if(sidePosition == (sideLength - 1)) {
            moveToNextSide()
            return 0
        }
        return sidePosition + 1
    }

    private moveToNextSide() {
        if("top" == side) side = "right"
        else if("right" == side) side = "bottom"
        else if("bottom" == side) side = "left"
        else if("left" == side) {
            side = "top"
            moveToNextRing()
        } else throw new RuntimeException("Wrong side: $side")
    }

    private moveToNextRing() {
        sideLength -= 2
        offsetX++
        offsetY++
    }
}
