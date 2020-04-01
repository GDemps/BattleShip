require 'minitest/autorun'
require 'minitest/pride'
require './lib/cell'
require './lib/ship'

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

  def test_it_is_fired_upon?
    assert_equal false, @cell.fired_upon?
  end

  def test_fire_upon
    cruiser = Ship.new("Cruiser", 3)
    @cell.place_ship(cruiser)
    @cell.fire_upon
    assert_equal true, @cell.fired_upon?
  end

  def test_fire_upon_reduces_ship_health
    cruiser = Ship.new("Cruiser", 3)
    @cell.place_ship(cruiser)
    @cell.fire_upon
    assert_equal 2, @cell.ship.health
  end

  def test_render_cell_not_fired_upon
    cell_1 = Cell.new("B4")
    assert_equal ".", cell_1.render
  end

  def test_render_cell_not_fire_upon
    cell_1 = Cell.new("B4")
    cell_1.fire_upon
    assert_equal "M", cell_1.render
  end

  def test_render_cell_hit
    cruiser = Ship.new("Cruiser", 3)
    cell_1 = Cell.new("B4")
    cell_1.place_ship(cruiser)
    cell_1.fire_upon
    assert_equal "H", cell_1.render
  end

  def test_render_hit_and_sink
    cruiser = Ship.new("Cruiser", 3)
    cell_1 = Cell.new("B4")
    cell_1.place_ship(cruiser)
    cell_1.fire_upon
    cell_1.fire_upon
    cell_1.fire_upon
    assert_equal "X", cell_1.render
  end

  def test_render_reveal_ship
    cruiser = Ship.new("Cruiser", 3)
    cell_2 = Cell.new("C3")
    cell_2.place_ship(cruiser)
    reveal_ship = true
    assert_equal "S", cell_2.render(reveal_ship)
  end

end
