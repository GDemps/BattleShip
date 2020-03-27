require 'minitest/autorun'
require 'minitest/pride'
require './lib/Cell'
require './lib/Ship'
require './lib/Board'

class BoardTest < Minitest::Test

  def test_instance_of_board
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

  def test_if_valid_placement?
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    #check valid coordinates
    assert_equal false, board.valid_placement?(cruiser, ["A1", "A5"])

    #same lenght as ship
    assert_equal false, board.valid_placement?(cruiser, ["A1", "A2"])
    assert_equal false, board.valid_placement?(submarine, ["A2", "A3", "A4"])
    #make sure consecutive
    assert_equal false, board.valid_placement?(cruiser, ["A1", "A2", "A4"])
    assert_equal false, board.valid_placement?(submarine, ["A1", "C1"])
    assert_equal false, board.valid_placement?(cruiser, ["A3", "A2", "A1"])
    assert_equal false, board.valid_placement?(submarine, ["C1", "B1"])
    #ensure not diagnal
    assert_equal false, board.valid_placement?(cruiser, ["A1", "B2", "C3"])
    assert_equal false, board.valid_placement?(submarine, ["C2", "D3"])
    #now is it valide placement?
    assert_equal true, board.valid_placement?(submarine, ["A1", "A2"])
    assert_equal true, board.valid_placement?(cruiser, ["B1", "C1", "D1"])


  end

end
