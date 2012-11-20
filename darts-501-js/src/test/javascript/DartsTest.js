
describe('creation', function(){
    
    it('creates a dart object correctly', function(){
        var dart501 = new Darts(501, 1);
        expect(dart501.points).toBe(501);
        expect(dart501.finished()).toBe(false);
        expect(dart501.winner).toBe("");

        var dart301_20Turns = new Darts(301, 20);
        expect(dart301_20Turns.points).toBe(301);
        expect(dart301_20Turns.finished()).toBe(false);
        expect(dart301_20Turns.winner).toBe("");
    });
});

describe('punctuation in a single turn', function(){
    
    it('substracts the 3 darts for player 1', function(){
        var dart = new Darts(501, 20);
        dart.turn([1, 1, 1], []);

        expect(dart.player1Points).toBe(498);
    });

    it('substracts the 3 darts for player 2', function(){
        var dart = new Darts(501, 20);
        dart.turn([], [1, 1, 1]);

        expect(dart.player2Points).toBe(498);
    });

    it('substracts the 3 darts for both players', function(){
        var dart = new Darts(501, 20);
        dart.turn([1, 2, 3], [1, 2, 3]);

        expect(dart.player1Points).toBe(495);
        expect(dart.player2Points).toBe(495);
    });
});

describe('turns', function(){
    
    it('counts one turn', function(){
        var dart = new Darts(501, 1);
        expect(dart.finished()).toBe(false);
        dart.turn([], []);

        expect(dart.finished()).toBe(true);
    });
    
    it('counts turns', function(){
        var dart = new Darts(501, 3);
        expect(dart.finished()).toBe(false);

        dart.turn([], []);
        expect(dart.finished()).toBe(false);

        dart.turn([], []);
        expect(dart.finished()).toBe(false);

        dart.turn([], []);
        expect(dart.finished()).toBe(true);
    });
    
    it('doesnt substract points if no turn left', function(){
        var dart = new Darts(501, 1);
        expect(dart.finished()).toBe(false);

        dart.turn([], []);
        expect(dart.finished()).toBe(true);
        
        dart.turn([1,1,1], [1,1,1]);
        expect(dart.finished()).toBe(true);
        expect(dart.player1Points).toBe(501);
        expect(dart.player2Points).toBe(501);
    });
});

describe('who wins', function(){
    
    it('player 1 wins with three darts', function(){
        var dart = new Darts(10, 1);
        expect(dart.winner).toBe("");
        
        dart.turn([4, 3, 3], []);
        expect(dart.player1Points).toBe(0);
        expect(dart.player2Points).toBe(10);
        expect(dart.winner).toBe("player 1");
    });
    
    it('player 2 wins with three darts', function(){
        var dart = new Darts(10, 1);
        expect(dart.winner).toBe("");
        
        dart.turn([], [4, 3, 3]);
        expect(dart.player1Points).toBe(10);
        expect(dart.player2Points).toBe(0);
        expect(dart.winner).toBe("player 2");
    });
    
    it('player 1 has preference over player 2', function(){
        var dart = new Darts(10, 1);
        expect(dart.winner).toBe("");
        
        dart.turn([4, 3, 3], [4, 3, 3]);
        expect(dart.player1Points).toBe(0);
        expect(dart.player2Points).toBe(10);
        expect(dart.winner).toBe("player 1");
    });
});

describe('last turn', function(){
    
    it('player 1 matches in the second dart', function(){
        var dart = new Darts(10, 1);
        
        dart.turn([5, 5, 1], []);
        expect(dart.player1Points).toBe(0);
    });
    
    it('player 1 matches in the first dart', function(){
        var dart = new Darts(10, 1);
        
        dart.turn([10, 1, 1], []);
        expect(dart.player1Points).toBe(0);
    });
    
    it('player 1 passes in the third dart', function(){
        var dart = new Darts(10, 1);
        
        dart.turn([5, 4, 2], []);
        expect(dart.player1Points).toBe(10);
    });
    
    it('player 1 passes in the second dart', function(){
        var dart = new Darts(10, 1);
        
        dart.turn([5, 6, 100], []);
        expect(dart.player1Points).toBe(10);
    });
    
    it('player 1 passes in the first dart', function(){
        var dart = new Darts(10, 1);
        
        dart.turn([11, 1, 1], []);
        expect(dart.player1Points).toBe(10);
    });
});

describe('a complete game', function() {

    it('wins player 1', function() {
        var game = new Darts(501, 20);

        game.turn([20, 1, 40], [60, 60, 0]);
        expect(game.player1Points).toBe(440);
        expect(game.player2Points).toBe(381);

        game.turn([60, 60, 60], [60, 60, 60]);
        expect(game.player1Points).toBe(260);
        expect(game.player2Points).toBe(201);

        game.turn([60, 60, 60], [1, 60, 60]);
        expect(game.player1Points).toBe(80);
        expect(game.player2Points).toBe(80);

        // el player 1 se pasa
        game.turn([60, 60, 60], [40, 20, 1]);
        expect(game.player1Points).toBe(80);
        expect(game.player2Points).toBe(19);

        // el player 1 gana porque tiene preferencia sobre el 2
        game.turn([60, 20, 1], [13, 6, 0]);
        expect(game.player1Points).toBe(0);
        expect(game.player2Points).toBe(19);
        expect(game.winner).toBe("player 1");
    });
});
