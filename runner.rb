require './lib/battleship'
Battleship.new


# require './lib/ship'
# require './lib/cell'
# require './lib/board'

# # start a new board
# board = Board.new

# # list off the ships
# cruiser = Ship.new("Cruiser", 3)
# submarine = Ship.new("Submarine", 2)

# # run the game
# # game will require a loop to go until either the computers or the players
# # ships have been sunk
# def start(board)
#     puts "Welcome to BATTLESHIP"
#     puts "Enter p to play. Enter q to quit."
#     user_input = gets.chomp
#     if user_input.include?("p")
#         print board.render
#         play_game(user_input)
#         board.render(true)
#     elsif user_input.include?("q")
#         puts "Type 'ruby runner.rb' to start."
#     end
# end

# def play_game(play)
#     @cruiser = Ship.new("Cruiser", 3)
#     @submarine = Ship.new("Submarine", 2)

#     puts "-------------------------------------"
#     puts "I have laid out my ships on the grid."
#     puts "You now need to lay out your two ships."
#     puts "The Cruiser is three units long and the Submarine is two units long."
#     puts "Place the Cruiser first."

#     placed_cruiser = gets.chomp.upcase
#     # require 'pry'; binding.pry
#     @cruiser.valid_placement?.valid
#     placed_cruiser.place_ship(@cruiser)

#     puts "Place the Submarine next."

#     placed_submarine = gets.chomp.upcase
#     placed_submarine.place_ship(@submarine)
# end


# start(board)