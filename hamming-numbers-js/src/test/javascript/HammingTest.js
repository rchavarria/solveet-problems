
var hamming = new Hamming();

describe('Hamming successions of several lengths', function(){
    
    it('tests sucession with length: 1', function(){
        var result = hamming.generate(1);
        expect(result).toEqual( [1] );
    });

    it('tests sucession with length: 2', function(){
        var result = hamming.generate(2);
        expect(result).toEqual( [1, 2] );
    });

    it('tests sucession with length: 6', function(){
        var result = hamming.generate(6);
        expect(result).toEqual( [1, 2, 3, 4, 5, 6] );
    });

    it('tests sucession with length: 7', function(){
        var result = hamming.generate(7);
        expect(result).toEqual( [1, 2, 3, 4, 5, 6, 8] );
    });

    it('tests sucession with length: 8', function(){
        var result = hamming.generate(8);
        expect(result).toEqual( [1, 2, 3, 4, 5, 6, 8, 9] );
    });

    it('tests sucession with length: 9', function(){
        var result = hamming.generate(9);
        expect(result).toEqual( [1, 2, 3, 4, 5, 6, 8, 9, 10] );
    });

    it('tests sucession with length: 10', function(){
        var result = hamming.generate(10);
        expect(result).toEqual( [1, 2, 3, 4, 5, 6, 8, 9, 10, 12] );
    });

    it('tests sucession with length: 11', function(){
        var result = hamming.generate(11);
        expect(result).toEqual( [1, 2, 3, 4, 5, 6, 8, 9, 10, 12, 15] );
    });

    it('tests sucession with length: 12', function(){
        var result = hamming.generate(12);
        expect(result).toEqual( [1, 2, 3, 4, 5, 6, 8, 9, 10, 12, 15, 16] );
    });

    it('tests sucession with length: 20', function(){
        var result = hamming.generate(20);
        expect(result).toEqual( [1, 2, 3, 4, 5, 6, 8, 9, 10, 12, 15, 16, 18, 20, 24, 25, 27, 30, 32, 36] );
    });
});
