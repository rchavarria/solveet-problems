/**
 *  Codigo completo y tests en: https://github.com/rchavarria/solveet-pascal-triangle
 */
class PascalTriangle {

    def generate(def rows) {
        return (0..(rows - 1)).collect {
            generateRow(it)
        }
    }
    
    private generateRow(def n) {
        return (0..n).collect {
            generateElement(n, it)
        }
    }
    
    private generateElement(def n, def p){
        return facto(n) / (facto(p) * facto(n - p)) as Integer
    }
    
    private facto(def number){
        (number <= 1) ? 1 : number * facto(number - 1)
    }
}
