class Player
  attr_reader :name,
              :board

  def initialize(name, board)
    @board = board
    @name = name
  end

  def combined_ship_health
    board.ships.sum(&:health)
  end

  def has_lost?
    combined_ship_health == 0
  end
end
