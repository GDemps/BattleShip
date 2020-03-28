require 'minitest/autorun'
require 'minitest/pride'
require './lib/Cell'
require './lib/Ship'
require './lib/board'
require 'pry'

class BoardTest < Minitest::Test

  def test_it_works
    board = Board.new
    assert_instance_of Board, board
  end

  def test_board_has_cells
    board = Board.new
    assert_equal 16, board.cells.count
    assert_equal :A1, board.cells.keys.first
    #assert_equal play with .last method to double double check
    assert_instance_of Cell, board.cells.values.first
  end

  def test_valid_coordinate?
    board = Board.new
    assert_equal true, board.valid_coordinate?("A1")
  end

  def test_valid_coordinate_false?
    board = Board.new
    assert_equal false, board.valid_coordinate?("A5")
    #could put this test in valid_coordinate
  end

  def test_there_is_a_valid_placement_horizontally
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal false, board.valid_placement?(cruiser, ["A1", "A2"])
    assert_equal false, board.valid_placement?(submarine, ["A2", "A3", "A4"])
    assert_equal false, board.valid_placement?(cruiser, ["A1", "A2", "A4"])
    assert_equal false, board.valid_placement?(cruiser, ["B1", "A2", "C3"])

    assert_equal true, board.valid_placement?(submarine, ["A1", "A2"])
    assert_equal true, board.valid_placement?(cruiser, ["A2", "A3", "A4"])
  end

  # def test_there_is_a_valid_placement_vertically
  #   board = Board.new
  #   cruiser = Ship.new("Cruiser", 3)
  #   assert_equal true, board.valid_placement?(cruiser, ["A1", "B1", "C1"])
  #   assert_equal false, board.valid_placement?(cruiser, ["A1", "B2", "B3"])
  # end
end
