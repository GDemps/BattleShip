class Board
  attr_reader :board

  def initialize
    @board = board
  end

  def cells
    @board.each do |coordinate, cell|
      p #{coordinate}
    end
  end
end
