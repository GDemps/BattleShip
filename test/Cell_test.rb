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

  def test_is_it_empty?
    assert_equal true, @cell.empty?
  end

  def test_if_cruiser_exists
    cruiser = Ship.new("Cruiser", 3)
    assert_instance_of Ship, cruiser
  end

  def test_if_place_ship_works
    cruiser = Ship.new("Cruiser", 3)
    @cell.place_ship(cruiser)
    assert_equal @cell.ship, cruiser
  end

end
