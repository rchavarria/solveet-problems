//
// Codigo completo (proyecto maven, tests, ...) se puede encontrar en:
//     https://github.com/rchavarria/solveet-problems/tree/master/hannoi-js
// Descripción detallada de la solución:
//     http://rchavarria.github.com/blog/2012/12/12/solveet-torres-de-hannoi
//
function Hannoi(rings) {
    var self = this;

    this.rings = rings;
    this.originTower = [];
    this.auxTower = [];
    this.targetTower = [];

    this.solve = function() {
        this.originTower = initOriginTower();
        var towers = defineTowers();

        while(this.targetTower.length != rings) {
            // move the smallest ring
            towers[0].push( towers[2].pop() );
            towers.push (towers.shift() );

            // check if it is already solved
            if(this.targetTower.length == rings) {
                break;
            }

            // next move
            var nextMoveOriginTower = calculateNextMoveOriginTower(towers);
            var nextMoveTargetTower = calculateNextMoveTargetTower(towers, nextMoveOriginTower);
            nextMoveTargetTower.push( nextMoveOriginTower.pop() );
        }
    };

    var initOriginTower = function() {
        var originTower = [];
        for (var i = self.rings; i > 0; i--) {
            originTower.push(i);
        };
        return originTower;
    };

    var defineTowers = function() {
        if(rings % 2 == 0) {
            return [self.auxTower, self.targetTower, self.originTower];
        } else {
            return [self.targetTower, self.auxTower, self.originTower];
        }
    };

    var calculateNextMoveOriginTower = function(towers) {
        var smallestUpperRing = calculateSmallestUpperRing(towers);

        for (var i = towers.length - 1; i >= 0; i--) {
            var t = towers[i];

            if(isEmpty(t)) continue;
            if(towerContainsSmallestRing(t)) continue;
            if(t[t.length - 1] != smallestUpperRing) continue;

            return t;
        };
    };

    var calculateNextMoveTargetTower = function(towers, nextMoveOriginTower) {
        var ringThatWillBeMoved = nextMoveOriginTower[nextMoveOriginTower.length - 1];
        for (var i = towers.length - 1; i >= 0; i--) {
            if(towerContainsSmallestRing(towers[i])) continue;
            if(towerContainsRing(towers[i], ringThatWillBeMoved)) continue;
            
            return towers[i];
        };

    };

    var calculateSmallestUpperRing = function(towers) {
        var smallestUpperRing = self.rings;
        for (var i = towers.length - 1; i >= 0; i--) {
            var t = towers[i];
            var upperRing = t[t.length - 1];
            if(upperRing != 1 && upperRing < smallestUpperRing) {
                smallestUpperRing = upperRing;
            }
        };
        return smallestUpperRing;
    }

    var isEmpty = function(tower) { return tower.length == 0; };
    var towerContainsSmallestRing = function(tower) { return tower.indexOf(1) >= 0; };
    var towerContainsRing = function(tower, ring) { 
        return tower.indexOf(ring) >= 0;
    };
};

// describe('solution to hannoi', function() {
    
//     var NUMBER_OF_RINGS = 4;

//     it('resolves the problem with a selected number of rings', function() {
//         var hannoi = new Hannoi(NUMBER_OF_RINGS);
//         hannoi.solve();

//         var expectedTargetTower = [];
//         for(var j = NUMBER_OF_RINGS; j > 0; j--) { expectedTargetTower.push(j); }
//         expect(hannoi.targetTower).toEqual(expectedTargetTower);
//     });
// });
