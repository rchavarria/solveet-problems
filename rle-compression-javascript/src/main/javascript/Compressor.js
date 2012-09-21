var Compressor = function () {

    // constants
    var MAX_OCCURRENCES = 5;

    // private functions
    var buildPartialOutput = function(nCharacters, character) {
        var partialOutput = "";

        for ( ; nCharacters > 0; nCharacters -= MAX_OCCURRENCES) {
            var number = (nCharacters > MAX_OCCURRENCES) ? MAX_OCCURRENCES : nCharacters;
            partialOutput += "" + number + character;
        }

        return partialOutput;
    }

    // class implementation
    return {
        rle : function(input) {
            if ("" == input) return "";

            return buildPartialOutput(input.length, input[0]);
        }
    };
} ();