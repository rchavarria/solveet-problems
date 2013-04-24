#
# Complete code and Unit Tests at 
#     https://github.com/rchavarria/solveet-problems/tree/master/guess-random-number-rb
#
class GuessGame

    def initialize(upperLimit, choice)
        @upperLimit = upperLimit
        @choice = choice
        @attemps = 0
    end

    def guess(n)
        @attemps += 1
        return "lower" if n < @choice
        return "greater" if n > @choice
        return @attemps if n == @choice
    end

    def play
        puts "Guess a number (1-100): "
        choice = gets.chomp.to_i

        result = guess(choice)
        if(result == "lower" || result == "greater")
            puts "Your guess is #{result}, please try again -> "
            play()
        else 
            puts "You guessed in #{result} attemps"
        end
    end

end
