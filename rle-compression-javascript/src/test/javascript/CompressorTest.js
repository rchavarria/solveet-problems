
describe('Given an empty input', function(){
    it('returns empty string', function(){
        var result = Compressor.rle("");
        expect(result).toBe("");
    });
});

describe('Given input: a', function(){
    it('returns 1a', function(){
        var result = Compressor.rle("a");
        expect(result).toBe("1a");
    });
});
