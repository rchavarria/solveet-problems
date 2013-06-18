import scala.io.Source

class Adder {

    def read(filePath: String): Int = {
        Source.fromFile(filePath)
              .getLines         // obtiene todas las lineas
              .drop(1)          // ignora la primera
              .map(_.toInt)     // convierte numero de cada fila a entero
              .filter(_ > 0)    // filtra los positivos
              .sum              // suma
    }
}