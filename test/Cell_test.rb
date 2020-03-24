require 'minitest/autorun'
require 'minitest/pride'
require './lib/Cell'
require './lib/Ship'

class CellTest < Minitest::Test

  def setup
    @cell1 = Cell.new("B4")
  end

  def test_if_cell_new_works
    assert_equal @cell1, "B4"
  end

end
