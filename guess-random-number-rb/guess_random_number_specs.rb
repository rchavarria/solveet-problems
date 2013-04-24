#
# Test class for GuessGame
#
# Run with command:
#     ruby guess_random_number_specs.rb

require './guess_random_number_impl'
require 'test/unit'
include Test::Unit::Assertions

class GuessGameTest < Test::Unit::TestCase

    def setup
    	upperLimit = 100
    	@defaultChoice = 50

    	@game = GuessGame.new(upperLimit, @defaultChoice)
    end

    def teardown
    end

    def test_creation
    	assert @game, "it should create an object"
    end

    def test_guessing_count_one_attemp
    	assert @game.guess(@defaultChoice) == 1, "it should return the number of attemps"
    end

    def test_guessing_more_than_one_attemp
        @game.guess(@defaultChoice - 1)
        @game.guess(@defaultChoice + 1)
        assert @game.guess(@defaultChoice) == 3, "it should count 3 attemps"
    end

    def test_guessing_with_lower_numbers
        assert @game.guess(@defaultChoice - 1) == "lower", "it should answer 'lower'"
    end

    def test_guessing_with_greater_numbers
        assert @game.guess(@defaultChoice + 1) == "greater", "it should answer 'greater'"
    end

    
end