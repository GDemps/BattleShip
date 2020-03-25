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
   # ship has been placed here
   # and if its hit the health is
   # affected if its not then health
   # isnt affected
  end
end
