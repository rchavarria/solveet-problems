//
// Codigo completo (proyecto maven, tests, ...) se puede encontrar en:
//     https://github.com/rchavarria/solveet-problems/tree/master/hamming-numbers-js
//
function Hamming() {

    var isHammingNumber =  function(num) {
        while (num % 5 == 0) num /= 5;
        while (num % 3 == 0) num /= 3;
        while (num % 2 == 0) num /= 2;

        return num == 1;
    };

    this.generate = function(n) {
        var succession = [1]
        var length = succession.length;

        var candidate = 2;
        while (length < n) {
            if (isHammingNumber(candidate)) {
                succession[length] = candidate;
                length++;
            }
            candidate++;
        }

        return succession;
    };
};