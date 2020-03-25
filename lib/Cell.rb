class Cell
require './lib/Ship'

  attr_reader :coordinate

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
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

end
