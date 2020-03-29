require 'minitest/autorun'
require 'minitest/pride'
require './lib/board'
require './lib/Cell'
require './lib/Ship'
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
  assert_equal false, player.has_lost?
  end
end
