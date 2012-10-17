/**
 * Complete solution and tests at: https://github.com/rchavarria/solveet-problems/tree/master/top-right
 */
class BarClient {

    def matrix

    // returns true if there is a path to the bathroom
    def existsAPathToTheBathroom() {
        // starts in the top right corner of the matrix (bathroom door)
        return canReachBottomLeftCorner(matrix[0].size() - 1, 0)
    }

    private canReachBottomLeftCorner(x, y) {
        def cangMoveLeft = canMoveToNextCell(x - 1, y)
        def canMoveBottom = canMoveToNextCell(x, y + 1)

        def existsPath = isBottomLeftCorner(x, y)
        if (cangMoveLeft) {
            existsPath = canReachBottomLeftCorner(x - 1, y)
        } 
        if (!existsPath && canMoveBottom) {
            existsPath = canReachBottomLeftCorner(x, y + 1)
        }
        
        return existsPath;
    }

    private canMoveToNextCell(x, y) {
        def columns = matrix[0].size()
        def rows = matrix.size()
        // check matrix bounds
        if(x < 0 || x >= columns) return false
        if(y < 0 || y >= rows) return false
        // cell is free to walk into it
        matrix[y][x] == "."
    }

    private isBottomLeftCorner(x, y) {
        x == 0 && y == (matrix.size() - 1)
    }
    
    // read the file, build the matrix (bar map) and search for the bathroom
    def parseFile(file) {
        def lines = new File(file).readLines()
        def output = "" 

        for (def i = 0; i < lines.size(); i++) {
            def line = lines[i]
            def rows = line.tokenize()[0] as Integer
            // build matrix
            matrix = []
            for (def j = 0; j < rows; j++) {
                i++
                matrix[j] = lines[i].toList()
            }
            // find bathroom if there is a bar matrix
            if (matrix.size() > 0) {
                output += existsAPathToTheBathroom() ? "bufff\n" : "ui ui ui\n"
            }
        }

        print output
        output
    }
}
