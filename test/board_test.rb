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
    board.cells
    {
   "A1" => Cell.new("A1"),
   "A2" => Cell.new("A2"),
   "A3" => Cell.new("A3"),
   "A4" => Cell.new("A4"),
   "B1" => Cell.new("A5"),
   "B2" => Cell.new("A6"),
   "B3" => Cell.new("A7"),
   "B4" => Cell.new("A8"),
   "C1" => Cell.new("A9"),
   "C2" => Cell.new("A10"),
   "C3" => Cell.new("A11"),
   "C4" => Cell.new("A12"),
   "D1" => Cell.new("A13"),
   "D2" => Cell.new("A14"),
   "D3" => Cell.new("A15"),
   "D4" => Cell.new("A16")
  }

    assert_equal (:board.cells)
  end


end
