class Cell
require './lib/Ship'

  attr_reader :coordinate

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @cell_has_been_hit = false
  end

  def ship
    @ship
  end

  def empty?
    @ship == nil
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @cell_has_been_hit
  end

  def fire_upon
    @cell_has_been_hit = true
    if @ship
      @ship.hit
    end
  end

  def render(reveal_ship = false)
    if @cell_has_been_hit && !@ship
      "M"
    elsif @ship && @ship.sunk?
      "X"
    elsif @cell_has_been_hit && @ship
      "H"
    elsif reveal_ship && !@cell_has_been_hit && @ship
      "S"
    else
      "."
    end
  end

end
