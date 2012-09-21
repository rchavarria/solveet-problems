var Compressor = function () {

    // private functions
    var buildPartialOutput = function(nCharacters, character) {
        return "" + nCharacters + character;
    }

    // class implementation
    return {
        rle : function(input) {
            if ("" == input) return "";

            return buildPartialOutput(input.length, input[0]);
        }
    };
} ();