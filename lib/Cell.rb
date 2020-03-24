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

end
