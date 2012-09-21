
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

describe('Given input with same characters', function(){
    it('returns 1a, 2a, 3a, ...', function(){
        var result = Compressor.rle("aa");
        expect(result).toBe("2a");

        result = Compressor.rle("bbb");
        expect(result).toBe("3b");

        result = Compressor.rle("cccc");
        expect(result).toBe("4c");

        result = Compressor.rle("ddddd");
        expect(result).toBe("5d");
    });
});

describe('Given input: six a(s)', function(){
    it('splits the output in 5a and 1a', function(){
        var result = Compressor.rle("aaaaaa");
        expect(result).toBe("5a1a");
    });
});