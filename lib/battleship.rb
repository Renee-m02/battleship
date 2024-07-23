require './lib/ship'
require './lib/cell'
require './lib/board'

class Battleship

    def initialize
        # create new boards
        @player_board = Board.new
        @computer_board = Board.new
        # players ships
        @player_cruiser = Ship.new("Cruiser", 3)
        @player_submarine = Ship.new("Submarine", 2)
        # computer ships
        @computer_cruiser = Ship.new("Cruiser", 3)
        @computer_submarine = Ship.new("Submarine", 2)
        start
    end

    def start_screen
        puts "Welcome to BATTLESHIP"
        puts "Enter p to play. Enter q to quit."
        start_input = gets.chomp
        if start_input.include("p")
            "Thanks for playing!"
        end
    end

    # run the game
    # game will require a loop to go until either the computers or the players
    # ships have been sunk
    def start
        # puts "Welcome to BATTLESHIP"
        # puts "Enter p to play. Enter q to quit."
        # user_input = gets.chomp
        # if user_input.include?("p")
        #     print board.render
        #     play_game(user_input)
        #     board.render(true)
        # elsif user_input.include?("q")
        #     puts "Type 'ruby runner.rb' to start."
        # end
    end

    # we need to place a loop in here so that the game restarts with a clean board
    # def play_game
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
end

# require 'pry'; binding.pry
# board.start(board)
