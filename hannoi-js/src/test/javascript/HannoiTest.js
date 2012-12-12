
describe('Solution to Hannoi towers problem', function() {

    it('accepts a number of rings to start with', function() {
        var hannoi = new Hannoi(3);

        expect(hannoi.rings).toBe(3);
        expect(hannoi.originTower).toEqual([]);
    });

    describe('method solve', function() {

        it('resolves the problem with one ring', function() {
            var hannoi = new Hannoi(1);

            // solve
            hannoi.solve();

            expect(hannoi.originTower).toEqual([]);
            expect(hannoi.auxTower).toEqual([]);
            expect(hannoi.targetTower).toEqual([1]);
        });

        it('resolves the problem with two rings', function() {
            var hannoi = new Hannoi(2);

            // solve
            hannoi.solve();

            expect(hannoi.originTower).toEqual([]);
            expect(hannoi.auxTower).toEqual([]);
            expect(hannoi.targetTower).toEqual([2, 1]);
        });

        it('resolves the problem with three rings', function() {
            var hannoi = new Hannoi(3);

            // solve
            hannoi.solve();

            expect(hannoi.originTower).toEqual([]);
            expect(hannoi.auxTower).toEqual([]);
            expect(hannoi.targetTower).toEqual([3, 2, 1]);
        });

        it('resolves the problem with four rings', function() {
            var hannoi = new Hannoi(4);

            // solve
            hannoi.solve();

            expect(hannoi.originTower).toEqual([]);
            expect(hannoi.auxTower).toEqual([]);
            expect(hannoi.targetTower).toEqual([4, 3, 2, 1]);
        });

        it('resolves the problem with five rings', function() {
            var hannoi = new Hannoi(5);

            // solve
            hannoi.solve();

            expect(hannoi.originTower).toEqual([]);
            expect(hannoi.auxTower).toEqual([]);
            expect(hannoi.targetTower).toEqual([5, 4, 3, 2, 1]);
        });

        it('resolves the problem with more than five rings', function() {
            for(var i = 6; i < 10; i++) {
                var hannoi = new Hannoi(i);
                hannoi.solve();

                var expectedTargetTower = [];
                for(var j = i; j > 0; j--) { expectedTargetTower.push(j); }
                expect(hannoi.targetTower).toEqual(expectedTargetTower);
            }
        });

    });
});