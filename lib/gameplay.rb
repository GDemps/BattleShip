require './lib/board.rb'
require './lib/cell.rb'
require './lib/ship.rb'
require 'pry';

class Gameplay
  def initialize

  end

  def start
    p "Welcome to BATTLESHIP!!!"
    p "Enter battle to play, or if you prefer peace, enter Q to quit."

    battle = gets.chomp

        if battle == "battle"
          computer_board = Board.new
          player_board = Board.new
          @computer_board = computer_board
          cruiser = Ship.new("Cruiser", 3)
          @cruiser = cruiser
          submarine = Ship.new("Submarine", 2)
          @submarine = submarine
          place_computers_ships
          #computer uses the place_ship method to
          #place_human_player_ships


        else
          puts "Oh, I see you prefer peace!"
        end
  end

  def place_computers_ships
    #choices = @game_board.cells.keys
    sub_array_of_options = [["A1", "A2"],
                            ["A2", "A3"],
                            ["A3", "A4"],
                            ["B1", "B2"],
                            ["B2", "B3"],
                            ["B3", "B4"],
                            ["C1", "C2"],
                            ["C2", "C3"],
                            ["C3", "C4"],
                            ["D1", "D2"],
                            ["D2", "D3"],
                            ["D3", "D4"],
                            ["A1", "B1"],
                            ["B1", "C1"],
                            ["C1", "D1"],
                            ["A2", "B2"],
                            ["B2", "C2"],
                            ["C2", "D2"],
                            ["A3", "B3"],
                            ["B3", "C3"],
                            ["C3", "D3"],
                            ["A4", "B4"],
                            ["B4", "C4"],
                            ["C4", "D4"]]

    computer_place_sub_coordinate = []
    computer_place_sub_coordinate << sub_array_of_options.sample
      @computer_board.valid_placement?(@submarine, computer_place_sub_coordinate.flatten) == true
      @computer_board.place(@submarine, computer_place_sub_coordinate.flatten)

    cruiser_array_of_options = [["A1", "A2", "A3"], ["A2", "A3", "A4"],
                        ["B1", "B2", "B3"], ["B2", "B3", "B4"],
                        ["C1", "C2", "C3"], ["C2", "C3", "C4"],
                        ["D1", "D2", "D3"], ["D2", "D3", "D4"],
                        ["A1", "B1", "C1"], ["B1", "C1", "D1"],
                        ["A2", "B2", "C2"], ["B2", "C2", "D2"],
                        ["A3", "B3", "C3"], ["B3", "C3", "D3"],
                        ["A4", "B4", "C4"], ["B4", "C4", "D4"]]
    computer_place_cruiser_coordinate = []
    computer_place_cruiser_coordinate << cruiser_array_of_options.sample

    if @computer_board.valid_placement?(@cruiser, computer_place_cruiser_coordinate.flatten) == true
      @computer_board.place(@cruiser, computer_place_cruiser_coordinate.flatten)
    end

  end

  def place_human_player_ships
    "I have laid out my ships on the grid.
You now need to lay out your two ships.
The Cruiser is three units long and the Submarine is two units long.
  1 2 3 4
A . . . .
B . . . .
C . . . .
D . . . .
Enter the squares for the Cruiser (3 spaces):"


  end

end
