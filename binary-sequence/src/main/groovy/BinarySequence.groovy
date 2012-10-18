/**
 * Complete solution and tests at: https://github.com/rchavarria/solveet-problems/tree/master/binary-sequence
 */
class BinarySequence {

    def periodicLength(sequence) {
        if(sequence.length() == 1) return 1

        def candidates = (1..sequence.length() / 2)

        def firstCandidate = candidates.find { sequenceLength ->
            def region = sequence[0..sequenceLength - 1]
            def repetitions = sequence.length() / sequenceLength as Integer

            (1..repetitions - 1).inject(true) { valid, regionIndex ->
                def sequenceOffset = regionIndex * sequenceLength
                def regionMatches = sequence.regionMatches(sequenceOffset, region, 0, sequenceLength)

                valid && regionMatches
            }
        }

        firstCandidate ? firstCandidate : 0
    }
}

// Showing how to use the class
/*
BinarySequence bs = new BinarySequence()
def sequence = "1101111011110111101111"
def sequenceLength = bs.periodicLength(sequence)
if (sequenceLength > 0) {
    def region = sequence[0..sequenceLength - 1]
    println "La secuencia es periódica"
    println "Periodo: $region"
    println "Longitud: $sequenceLength"
} else {
    println "La secuencia no es periódica"
}
*/
