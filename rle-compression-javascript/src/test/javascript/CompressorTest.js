
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

describe('Given input with different characters', function(){
    it('returns the corresponding output, e.g.: 1a1b', function(){
       var result = Compressor.rle('ab');
        expect(result).toBe('1a1b');

        result = Compressor.rle('aabb');
        expect(result).toBe('2a2b');

        result = Compressor.rle('aaabbbccc');
        expect(result).toBe('3a3b3c');

        result = Compressor.rle('aaaabbbbccccdddd');
        expect(result).toBe('4a4b4c4d');
    });
});

describe('Given input with different characters and more than 5 equal characters', function(){
    it('returns the corresponding output, e.g.: 1a2b3c4d5e5f1f', function(){
        var result = Compressor.rle('abbcccddddeeeeeffffff');
        expect(result).toBe('1a2b3c4d5e5f1f');
    });
});
