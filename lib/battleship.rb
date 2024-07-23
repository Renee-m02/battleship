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
    end

    # run the game
    # game will require a loop to go until either the computers or the players
    # ships have been sunk
    def start
        start_screen
        start_input = gets.chomp

        until start_input == "p" || start_input == "q"
            puts "Invalid entry. Please enter 'p' to play or 'q' to quit."
            start_input = gets.chomp.downcase
        end

        if start_input.include?("p")
            play_game
        elsif start_input = 'q'
            puts "Thanks for playing!"
            exit
        end
    end

    # we need to place a loop in here so that the game restarts with a clean board
    def play_game
        # computer places ships
        computer_ship_placement(@)
        computer_ship_placement(@)
        place_ships_message
        player_ship_placement(ship)
        player_ship_placement(ship)
        game_loop
    end

    def place_ships_message
        puts "-------------------------------------"
        puts "I have laid out my ships on the grid."
        puts "You now need to lay out your two ships."
        puts "The Cruiser is three units long and the Submarine is two units long."
        puts "Place the Cruiser first."
    end

    def player_ship_placement(ship)
        user_input = 
    end
end

# require 'pry'; binding.pry
# board.start(board)
