require_relative 'board'
require_relative 'Cell'
require_relative 'Ship'

class Runner
  def start
    p "Welcome to BATTLESHIP!!!"
    p "Enter battle to play, or if you prefer peace, enter Q to quit."

    battle = gets.chomp

    if battle == "battle"
      standard_board = create_standard_board
      players  = create_two_players(standard_board)
      start_game(players.first, players.last)
    else
      puts "Oh, I see you prefer peace!"
    end
  end

  def  create_two_players(board)
    deck.shuffle
    p "Enter player 1 name"
    player1_name = gets.chomp
    player1 = Player.new(player1_name, Board.new)
    [player1]
  end
end

runner = Runner.new
runner.start
