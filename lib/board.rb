class Board

    attr_reader :cells

    def initialize
        @cells = {
            "A1" => Cell.new("A1"),
            "A2" => Cell.new("A2"),
            "A3" => Cell.new("A3"),
            "A4" => Cell.new("A4"),
            "B1" => Cell.new("B1"),
            "B2" => Cell.new("B2"),
            "B3" => Cell.new("B3"),
            "B4" => Cell.new("B4"),
            "C1" => Cell.new("C1"),
            "C2" => Cell.new("C2"),
            "C3" => Cell.new("C3"),
            "C4" => Cell.new("C4"),
            "D1" => Cell.new("D1"),
            "D2" => Cell.new("D2"),
            "D3" => Cell.new("D3"),
            "D4" => Cell.new("D4")
        }
    end

    def valid_coordinate?(coordinate)
        if @cells.include?(coordinate)
            true
        else
            false
        end
    end

    # In valid placement we need to show that the cruiser must equal 2 spaces or else false 
    # AND that the submarine must equal 3 spaces or else false. 
    def valid_placement?(ship_name, desired_coordinates)
        result = false
        if desired_coordinates.length == ship_name.length
            result = true
        else 
            result = false
        end

        horizontal = horizontal_letter_check?(desired_coordinates) && horizontal_number_check?(desired_coordinates)
    
        if  horizontal 
            result = true
        else
            result = false
        end
        
        vertical = vertical_letter_check?(desired_coordinates) && vertical_number_check?(desired_coordinates)
        
        if vertical
            result = true
        else
            result = false
        end

        return result    
    end
  
    def horizontal_letter_check?(desired_coordinates)
        verify = false
        char_to_check = desired_coordinates[0][0]

        desired_coordinates.each do |coord|
            if coord[0] == char_to_check
                verify = true
            else
                verify = false
                break
            end
        end

       return verify
    end

    def vertical_letter_check?(desired_coordinates)
        verify = false
        letter_to_check = desired_coordinates[0][0]
        # require 'pry'; binding.pry
        desired_coordinates.shift

        desired_coordinates.each do |coord|
            desired_coord = coord[0] == (letter_to_check.next)
    
            if desired_coord
                verify = true
                letter_to_check = coord[0]
            else 
                verify = false
                break 
            end
        end
        
        return verify
    end
    
    def horizontal_number_check?(desired_coordinates)
        verify = false
        num_to_check = desired_coordinates[0][1].to_i
        desired_coordinates.shift

        desired_coordinates.each do |coord|
            desired_coord = coord[1].to_i == (num_to_check + 1)
            if desired_coord
                verify = true
                num_to_check = coord[1].to_i
            else
                verify = false
                break
            end
        end
        return verify
    end

    def vertical_number_check?(desired_coordinates)
        verify = false
        num_to_check = desired_coordinates[0][1]

        desired_coordinates.each do |coord|
            if coord[1] == num_to_check
                verify = true
            else
                verify = false
                break
            end
        end
        return verify
    end
end
