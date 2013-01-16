//
// Codigo completo (proyecto maven, tests, ...) se puede encontrar en:
//     https://github.com/rchavarria/solveet-problems/tree/master/happy-number-js
//

var MAX_ITERATIONS = 20;

function isHappyNumber(n) {
    var iteration = 1;
    var currentNumber = sumOfSquares(n);

    while(currentNumber != 1 && iteration < MAX_ITERATIONS) {
        currentNumber = sumOfSquares(currentNumber);
        iteration ++;
    }

    return iteration < MAX_ITERATIONS;
};

function sumOfSquares(n) {
    var digits = splitDigits(n);
    var sum = 0;
    for(var i = 0; i < digits.length; i++) {
        var d = digits[i];
        sum += (d * d);
    }
    return sum;
};

function splitDigits(n) {
    var digits = [];
    while(n > 0) {
        digits.push(n % 10);
        n = Math.floor(n / 10);
    }
    return digits;
};

//
// Un test de Jasmine para comprobar la solucion
// describe('solution to happy number', function() {
//     it('searches happy numbers up to 100', function() {
//         var knownHappyNumbers = [ 1,  7, 10, 13, 19, 23, 28, 31, 32, 44,  
//                                  49, 68, 70, 79, 82, 86, 91, 94, 97, 100];

//         for(var i = 1; i <= 100; i++) {
//             var knownAsHappy = knownHappyNumbers.indexOf(i) != -1;
//             expect(isHappyNumber(i)).toBe(knownAsHappy);
//         }
//     });
// });
