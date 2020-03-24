class Cell
require './lib/Ship'
require 'pry'

  def initialize(coordinate, ship = nil)
    @coordinate = coordinate
    @ship = nil
  end

end
