/**
 * Complete solution and tests at: https://github.com/rchavarria/solveet-problems/tree/master/senw-route
 */
class Router {
    
    def follow(map, route){
        if(route == "") [1, 1]

        try { return performMovements(map, route) }
        catch (Exception e) { return -1 }
    }

    private performMovements(map, route) {
        int row = 1
        int column = 1
        
        route.each { movement ->
            switch(movement) {
                case "E": column++; break
                case "W": column--; break
                case "S": row++; break
                case "N": row--; break
            }
            
            checkWalkableRow(map, row, column)
        }

        [row, column]
    }

    /**
     * throws an exception if you can not walk on the cell
     * or you walk outside the cell matrix
     */
    private checkWalkableRow(map, row, column) {
        if(map[row - 1][column - 1] != 1)
            throw new Exception()
    }
}