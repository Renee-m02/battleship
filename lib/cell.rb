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

  def place_ship(cruiser)
    @ship = cruiser
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
    elsif empty? && fired_upon?
      return "M"
    elsif !empty? && @ship.health == 0 && @ship.sunk? == true
      return "X"
    elsif fired_upon? && !empty?
      return "H"   
    elsif optional 
      return "S" 
    end
  end

end 