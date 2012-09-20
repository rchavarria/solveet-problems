/**
 *  Codigo completo y tests en: https://github.com/rchavarria/solveet-pascal-triangle
 */
class Compressor {

    def rle(input){
        if("".equals(input)) return ""

        def output = ""
        for(int i = 0; i < input.length(); ){
            def character = input.charAt(i)
            def characterOccurrences = countCharacters(input, i, character)
            i += characterOccurrences

            output += buildPartialOutput(characterOccurrences, character)
        }

        output
    }

    private countCharacters(input, i, character) {
        def count = 0
        while(i < input.length() && input.charAt(i) == character) {
            i++
            count++
        }
        count
    }

    private buildPartialOutput(characterOccurrences, character) {
        "" + characterOccurrences + character
    }
}
