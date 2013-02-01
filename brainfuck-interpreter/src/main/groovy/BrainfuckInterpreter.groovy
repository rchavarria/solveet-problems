/**
 * Complete solution and tests at: https://github.com/rchavarria/solveet-problems/tree/master/brainfuck-interpreter
 */
class BrainfuckInterpreter {

    def memory
    def memPointer = 0
    def programPointer = 0

    public BrainfuckInterpreter() {
        memory = initMemory()
    }

    private initMemory() {
        def mem = []
        (0..99).each { mem[it] = 0 }
        mem
    }

    public execute(code, input="") {
        def inputPointer = 0
        def output = []

        while(programPointer < code.length()) {
            def currentInstruction = code[programPointer]
            programPointer++

            switch(currentInstruction) {
                case '+':
                    memory[memPointer]++
                    break

                case '-':
                    memory[memPointer]--
                    break

                case '>':
                    memPointer++
                    break

                case '<':
                    memPointer--
                    break

                case '.':
                    output << (char) memory[memPointer]
                    break

                case ',':
                    char inputChar = input[inputPointer] as char
                    inputPointer++

                    memory[memPointer] = inputChar
                    break

                case '[':
                    programPointer = (memory[memPointer] == (char) 0) ?
                        code.indexOf("]", programPointer) + 1 :
                        programPointer
                    break

                case ']':
                    def reverseProgramPointer = code.length() - programPointer
                    reverseProgramPointer = code.reverse().indexOf("[", reverseProgramPointer)
                    programPointer = code.length() - reverseProgramPointer - 1
                    break
            }
        }

        output
    }
}
