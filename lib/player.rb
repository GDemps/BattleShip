class Player
  attr_reader :name,
              :board

  def initialize(name, board)
    @board = board
    @name = name
  end

  def combined_ship_health(health)
    cruiser + submarine
  end

  def has_lost?
    #require 'pry'; binding.pry
    board.combined_ship_health == 0
  end
end
