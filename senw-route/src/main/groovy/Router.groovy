/**
 * Solucion completa y test en: https://github.com/rchavarria/solveet-problems/tree/master/senw-route
 */
class Router {
    
    def follow(map, route){
        if(route == "") [1, 1]

        int row = 1
        int column = 1

        try {
            route.each { movement ->
                switch(movement) {
                    case "E":
                        column++
                        break
                    case "S":
                        row++
                        break
                    case "N":
                        row--
                        break
                    case "W":
                        column--
                        break
                }
                
                checkWalkableRow(map, row, column)
            }

        } catch (Exception e) {
            return -1
        }

        [row, column]
    }

    // throws an exception if you can not walk on the cell
    private checkWalkableRow(map, row, column) {
        if(map[row - 1][column - 1] != 1)
            throw new Exception()
    }
}