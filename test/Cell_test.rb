require 'minitest/autorun'
require 'minitest/pride'
require './lib/Cell'
require './lib/Ship'

class CellTest < Minitest::Test

  def setup
    @cell = Cell.new("B4")
  end

  def test_it_works
    assert_instance_of Cell, @cell
  end

  def test_coordinate_value
    assert_equal "B4", @cell.coordinate
  end

  def test_ship_element
    assert_nil nil, @cell.ship
  end

end
