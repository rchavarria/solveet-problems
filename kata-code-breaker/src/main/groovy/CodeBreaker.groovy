/**
 * Complete solution and tests at: https://github.com/rchavarria/solveet-problems/tree/master/kata-code-breaker
 *
 * Run this command to play:
 *      groovy src/main/groovy/CodeGreaker.groovy
 */
class CodeBreaker {

    def reader = System.in.newReader()
    def code

    def unlock(password) {
        if(code.equals(password)) return "*" * code.length()

        def result = []
        code.eachWithIndex { item, index -> 
            if(password[index] == item) {
                result << "*"
            } else if(password.contains(item)) {
                result << "N"
            }
        }

        return result.sort().reverse().join("")
    }

    public static void main(String[] args) {
        def code = randomCode()
        def game = new CodeBreaker(code: code)
        game.play()
    }

    private static randomCode() {
        def digits = ["R", "A", "M", "V", "N", "I"]

        new Random().with {
            (1..4).collect { digits[ nextInt(digits.size()) ] }.join()
        }
    }

    def play() {
        def result = ""
        while(result != "****") {
            print "Escribe tu codigo: "
            def password = reader.readLine()
            result = unlock(password)
            println "Resultado de tu codigo: ${result}"
        }

        println "Felicidades, el codigo era: ${code}"
    }
}
