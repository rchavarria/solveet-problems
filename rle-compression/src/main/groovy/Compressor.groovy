
class Compressor {
    private static final int MAX_OCCURRENCES = 5

    def rle(input){
        if("".equals(input)) return ""

        def output = ""
        def i = 0
        while (i < input.length()) {
            def character = input.charAt(i)
            def nCharacters = countCharacters(input, i, character)
            i += nCharacters

            output += buildPartialOutput(nCharacters, character)
        }

        output
    }

    private countCharacters(input, i, character) {
        def count = 0
        for( ; isCountableCharacter(input, i, character); i++) {
            count ++
        }
        count
    }

    private isCountableCharacter(input, i, character) {
        return (i < input.length()) &&          // index not out of bounds
               (input.charAt(i) == character)   // same character
    }

    private buildPartialOutput(nCharacters, character) {
        def partialOutput = ""
        while(nCharacters > MAX_OCCURRENCES) {
            partialOutput += MAX_OCCURRENCES.toString() + character
            nCharacters -= MAX_OCCURRENCES
        }
        partialOutput += nCharacters.toString() + character

        partialOutput
    }
}
