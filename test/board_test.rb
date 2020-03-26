require 'minitest/autorun'
require 'minitest/pride'
require './lib/Cell'
require './lib/Ship'
require './lib/board'

class BoardTest < Minitest::Test

  def test_it_works
    board = Board.new
    assert_instance_of Board, board
  end

  def test_board_has_cells
    board = Board.new
    assert_equal 16, board.cells.count
    assert_equal :A1, board.cells.keys.first
    assert_instance_of Cell, board.cells.values.first
  end

  def test_valid_coordinate?
    board = Board.new
    assert_equal true, board.valid_coordinate?("A1")
  end

  def test_valid_coordinate_false?
    board = Board.new
    assert_equal false, board.valid_coordinate?("A5")
  end
end
