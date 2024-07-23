class Cell

  attr_reader  :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
  end

  def empty?
    @ship.nil?
     
  end

  def place_ship(ship)
    @ship = ship
  end
  
  def fire_upon
    @fired_upon = true
    if @ship != nil
      @ship.hit
    end
  end

  def fired_upon?
    @fired_upon
  end

  def render(optional = nil)
    
    
    # require 'pry'; binding.pry
    if empty? && fired_upon?
      return "M"
    elsif !empty? && @ship.health == 0 && @ship.sunk? == true
      return "X"
    elsif fired_upon? && !empty?
      return "H" 
    elsif optional == true && !empty?
      return "S" 
    else
      return "." 
    end
  end

end 