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
    assert_equal "A1", board.cells.keys.first
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

  def test_coordinates_same_length_as_ship
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    assert_equal false, board.valid_placement?(cruiser, ["A1", "A2"])
    assert_equal false, board.valid_placement?(submarine, ["A2", "A3", "A4"])
  end

  def test_it_has_consecutive_coordinates
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    assert_equal false, board.valid_placement?(cruiser, ["A1", "A2", "A4"])
    assert_equal false, board.valid_placement?(submarine, ["A1", "C1"])
    assert_equal false, board.valid_placement?(cruiser, ["A3", "A2", "A1"])
    assert_equal false, board.valid_placement?(submarine, ["C1", "B1"])

    assert_equal true, board.valid_placement?(cruiser, ["A1", "A2", "A3"])
  end

  def test_it_doesnt_have_diagonal_coordinates
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    assert_equal true, board.valid_placement?(submarine, ["A1", "A2"])
    assert_equal true, board.valid_placement?(cruiser, ["B1", "C1", "D1"])

    assert_equal false, board.valid_placement?(cruiser, ["A1", "B2", "C3"])
    assert_equal false, board.valid_placement?(submarine, ["C2", "D3"])
  end

  def test_ship_has_a_place
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "A2", "A3"])
    cell_1 = board.cells["A1"]
    cell_2 = board.cells["A2"]
    cell_3 = board.cells["A3"]
    assert_equal cruiser, board.cells["A1"].ship
    assert_equal cruiser, board.cells["A2"].ship
    assert_equal cruiser, board.cells["A3"].ship
  end

  def test_cells_all_have_ships
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "A2", "A3"])
  end

  def test_can_ships_overlap
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    board.place(cruiser, ["A1", "A2", "A3"])
    cell_1 = board.cells["A1"]
    cell_2 = board.cells["A2"]
    cell_3 = board.cells["A3"]
    assert_equal false, board.valid_placement?(submarine, ["A1", "B2"])
  end
end
