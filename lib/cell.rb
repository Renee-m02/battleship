class Cell

  attr_reader  :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
  end

  def empty?
    if @ship == nil 
      true
    else 
      false
    end
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
    if !@fired_upon && !optional
      return "." 
    elsif !empty? && @fired_upon == true && @ship.sunk? == false
      return "M"
    elsif !@fired_up && empty? 
      return "H" 
    elsif optional == true 
      return "S"  
    elsif !empty? && @ship.health == 0 && @ship.sunk? 
      return "X" 
    end
  end

end 