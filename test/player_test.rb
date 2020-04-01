require 'minitest/autorun'
require 'minitest/pride'
require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/player'

class PlayerTest < Minitest::Test
  def setup
    @board = Board.new
  end

  def test_it_exists
    player = Player.new("Frank", @board)
    assert_instance_of Player, player
  end

  def test_player_has_a_name
    player = Player.new("Frank", @board)
    assert_equal "Frank", player.name
  end

  def test_player_has_a_board
    player = Player.new("Frank", @board)
    assert_equal @board, player.board
  end

  def test_has_lost?
  player = Player.new("Frank", @board)
  cruiser = Ship.new("Cruiser", 3)
  submarine = Ship.new("Submarine", 2)
  @board.place(cruiser, ["A1","A2", "A3"])
  @board.place(submarine, ["B2", "B3"])
  assert_equal false, player.has_lost?
  end

  def test_has_lost_returns_true_when_health_zero
    player = Player.new("Frank", @board)
    cruiser = Ship.new("Cruiser", 0)
    submarine = Ship.new("Submarine", 0)
    @board.place(cruiser, [])
    @board.place(submarine, [])
    assert_equal true, player.has_lost?
  end
end
