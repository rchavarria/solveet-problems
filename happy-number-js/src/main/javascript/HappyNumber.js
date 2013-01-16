//
// Codigo completo (proyecto maven, tests, ...) se puede encontrar en:
//     https://github.com/rchavarria/solveet-problems/tree/master/happy-number-js
//

var MAX_TRIALS = 20;

function isHappyNumber(n) {
    var trial = 1;
    var currentNumber = sumOfSquares(n);

    while(currentNumber != 1 && trial < MAX_TRIALS) {
        currentNumber = sumOfSquares(currentNumber);
        trial ++;
    }

    return trial < MAX_TRIALS;
};

function sumOfSquares(n) {
    var hundreths = Math.floor(n / 100);
    var tenths = Math.floor((n % 100) / 10);
    var units = n % 10;

    return units * units + tenths * tenths + hundreths * hundreths;
}

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
