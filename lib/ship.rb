class Ship

  attr_reader :name, :length, :health

  def initialize(ship_name, length)
    @ship_name = ship_name
    @length = length
    @health = @length
  end


end