# If you want to play, run:
#     ruby play.rb

require './guess_random_number_impl'

# playing the game
upperLimit = 100
choice = Random.new().rand(upperLimit)
puts "choice is #{choice}, shhhh"

game = GuessGame.new(upperLimit, choice)
game.play()