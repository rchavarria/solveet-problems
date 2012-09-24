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
    };

    var countSameCharacters = function(input, i) {
        var character = input[i];
        for(var j = i; j < input.length; j++) {
            if(input[j] != character) {
                return j - i;
            }
        }

        return input.length - i;
    };

    // class implementation
    return {
        rle : function(input) {
            if ("" == input) return "";

            var output = "";
            for(var i = 0; i < input.length; ) {
                var character = input[i];
                var nCharacters = countSameCharacters(input, i);
                output += buildPartialOutput(nCharacters, character);

                i += nCharacters;
            }

            return output;
        }
    };
} ();