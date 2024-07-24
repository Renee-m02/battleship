require './lib/ship'
require './lib/cell'
require './lib/board'

class Battleship

    def initialize
        @player_board = Board.new
        @computer_board = Board.new
        @player_cruiser = Ship.new("Cruiser", 3)
        @player_submarine = Ship.new("Submarine", 2)
        @computer_cruiser = Ship.new("Cruiser", 3)
        @computer_submarine = Ship.new("Submarine", 2)
        start
    end

    def start
        start_screen
        start_input = gets.chomp
        until start_input == "p" || start_input == "q"
            puts "Invalid entry. Please enter 'p' to play or 'q' to quit."
            start_input = gets.chomp.downcase
        end
        if start_input.include?("p")
            play_game
        elsif start_input == 'q'
            puts "Thanks for playing!"
            exit
        end
    end

    def start_screen
        puts "Welcome to BATTLESHIP"
        puts "Enter p to play. Enter q to quit."
    end

    def play_game
        computer_ship_placement(@computer_cruiser)
        computer_ship_placement(@computer_submarine)
        place_ships_message
        player_ship_placement(@player_cruiser)
        player_ship_placement(@player_submarine)
        print @player_board.render(true)
        game_loop
    end

    def computer_ship_placement(ship)
        random_coords = @computer_board.cells.keys.sample(ship.length)
        until @computer_board.valid_placement?(ship, random_coords) == true
            random_coords = @computer_board.cells.keys.sample(ship.length)
        end
        @computer_board.place(ship, random_coords)
    end

    def place_ships_message
        puts "\n-------------------------------------\n"
        puts "I have laid out my ships on the grid."
        puts "You now need to lay out your two ships."
        puts "The Cruiser is three units long and the Submarine is two units long."
        puts "Place the Cruiser first."
    end

    def player_ship_placement(ship)
        print @player_board.render(true)
        puts "Enter the #{ship.length} squares for the #{ship.name}."
        user_input = gets.chomp.upcase.split(/\s+/)
        if @player_board.valid_placement?(ship, user_input) && user_input.all? { |coord| @player_board.cells.key?(coord) }
            @player_board.place(ship, user_input)
            puts "Your #{ship.name} has been placed."
        else 
            until @player_board.valid_placement?(ship, user_input) == true
                puts "Invalid ship placement. Please try again."
                user_input = gets.chomp.upcase.split(/\s+/)
            end
            @player_board.place(ship, user_input)
        end
    end

    def game_loop
        puts "-------------------------------------"
        puts "Cannons ready!"
        puts "-------------------------------------"
        puts 'PLAYER BOARD'
        print @player_board.render(true)
        puts 'COMPUTER BOARD'
        print @computer_board.render
        until @player_cruiser.sunk? && @player_submarine.sunk? || @computer_cruiser.sunk? && @computer_submarine.sunk?
            player_turn
            computer_turn
        end
        if @player_cruiser.sunk? && @player_submarine.sunk? 
            puts "I win! Better luck next time."
        elsif @computer_cruiser.sunk? && @computer_submarine.sunk?
            puts "Congratulations! You are the winner!"
        end
    end

    def player_turn
        puts "Please enter the coordinate you wish to fire upon."
        input_coord = gets.chomp.upcase
        until @computer_board.cells[input_coord].fired_upon? == false && @computer_board.valid_coordinate?(input_coord) == true
            puts "You have already fired on this coordinate. Please select another one."
            input_coord = gets.chomp.upcase
        end
        @computer_board.cells[input_coord].fire_upon
        puts "You have fired upon cell #{input_coord}. The result is a #{@computer_board.cells[input_coord].render(true)}."
        puts "\n-------------------------------------\n"
        puts 'PLAYER BOARD'
        print @player_board.render(true)
        puts 'COMPUTER BOARD'
        print @computer_board.render
    end

    def computer_turn
        puts "It is now my turn to fire."
        random_shot = @player_board.cells.keys.sample
        until @player_board.cells[random_shot].fired_upon? == false && @player_board.valid_coordinate?(random_shot) == true
            random_shot = @player_board.cells.keys.sample
        end
        @player_board.cells[random_shot].fire_upon
        puts "I have fired upon #{random_shot}. The result is a #{@player_board.cells[random_shot].render}"
        puts "\n-------------------------------------\n"
        puts 'PLAYER BOARD'
        print @player_board.render(true)
        puts 'COMPUTER BOARD'
        print @computer_board.render
    end
end
