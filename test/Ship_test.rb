require 'minitest/autorun'
require 'minitest/pride'
require './lib/Ship.rb'


class ShipTest < Minitest::Test

  def test_it_exists
    cruiser = Ship.new("Cruiser", 3)
    assert_instance_of Ship, cruiser
  end

  def test_it_has_a_name
    cruiser = Ship.new("Cruiser", 3)
    assert_equal "Cruiser", cruiser.name
  end

  def test_it_has_health
    cruiser = Ship.new("Cruiser", 3)
    assert_equal 3, cruiser.health
  end

  def test_has_a_length
    cruiser = Ship.new("Cruiser", 3)
    assert_equal 3, cruiser.length

  end

  def test_it_has_sunk
    cruiser = Ship.new("Cruiser", 3)
    assert_equal false, cruiser.sunk?
  end

  def test_it_can_be_hit
    cruiser = Ship.new("Cruiser", 3)
    assert_equal 2, cruiser.hit
  end
end
