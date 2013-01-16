
describe('Solution to Happy numbers problem', function() {

    it('says #1 is happy', function() {
        var happy = isHappyNumber(1);
        expect(happy).toBe(true);
    });

    it('says #2 is not happy', function() {
        var happy = isHappyNumber(2);
        expect(happy).toBe(false);
    });

    it('says #3 is not happy', function() {
        var happy = isHappyNumber(3);
        expect(happy).toBe(false);
    });

    it('says #4 is not happy', function() {
        var happy = isHappyNumber(4);
        expect(happy).toBe(false);
    });

    it('says #5 is not happy', function() {
        var happy = isHappyNumber(5);
        expect(happy).toBe(false);
    });

    it('says #6 is not happy', function() {
        var happy = isHappyNumber(6);
        expect(happy).toBe(false);
    });

    it('says #7 is happy', function() {
        var happy = isHappyNumber(7);
        expect(happy).toBe(true);
    });


    describe('some happy numbers', function() {
        
        it('knows that 10, 13 and 19 are happy', function() {
            expect(isHappyNumber(10)).toBe(true);
            expect(isHappyNumber(13)).toBe(true);
            expect(isHappyNumber(19)).toBe(true);
        });
    });


    describe('some unhappy numbers', function() {
        
        it('knows that 8, 9, 12, 15 and 20 are happy', function() {
            expect(isHappyNumber(8)).toBe(false);
            expect(isHappyNumber(9)).toBe(false);
            expect(isHappyNumber(12)).toBe(false);
            expect(isHappyNumber(15)).toBe(false);
            expect(isHappyNumber(20)).toBe(false);
        });
    });


    describe('happy numbers from 1 to 100', function() {

        it('searches happy numbers up to 100', function() {
            var knownHappyNumbers = [1, 7, 10, 13, 19, 23, 28, 31, 32, 44, 49, 68, 70, 79, 82, 86, 91, 94, 97, 100];

            for(var i = 1; i <= 100; i++) {
                var knownAsHappy = knownHappyNumbers.indexOf(i) != -1;
                expect(isHappyNumber(i)).toBe(knownAsHappy);
            }
        });
    });
});