
describe('Given an empty input', function(){
    it('returns empty string', function(){
        var result = Compressor.rle("");
        expect(result).toBe("");
    });
});
