require './lib/board.rb'
require './lib/cell.rb'
require './lib/ship.rb'

class Gameplay
  def initialize

  end

  def start
    p "Welcome to BATTLESHIP!!!"
    p "Enter battle to play, or if you prefer peace, enter Q to quit."

    battle = gets.chomp

    if battle == "battle"
          @computer_board = Board.new
          @player_board = Board.new
          @cruiser = Ship.new("Cruiser", 3)
          @submarine = Ship.new("Submarine", 2)
          place_computers_ships
          place_human_player_ships
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

    computer_place_sub_coordinate = sub_array_of_options.sample
    @computer_board.place(@submarine, computer_place_sub_coordinate)

    cruiser_array_of_options = [["A1", "A2", "A3"], ["A2", "A3", "A4"],
                                ["B1", "B2", "B3"], ["B2", "B3", "B4"],
                                ["C1", "C2", "C3"], ["C2", "C3", "C4"],
                                ["D1", "D2", "D3"], ["D2", "D3", "D4"],
                                ["A1", "B1", "C1"], ["B1", "C1", "D1"],
                                ["A2", "B2", "C2"], ["B2", "C2", "D2"],
                                ["A3", "B3", "C3"], ["B3", "C3", "D3"],
                                ["A4", "B4", "C4"], ["B4", "C4", "D4"]]
    computer_place_cruiser_coordinate = cruiser_array_of_options.sample
    @computer_board.place(@cruiser, computer_place_cruiser_coordinate.flatten)

    # ensure no overlap
  end

  def place_human_player_ships
    @player_board = Board.new
    p "I have laid out my ships on the grid."
    p "You now need to lay out your two ships."
    p "The Cruiser is three units long and the Submarine is two units long."
    p @player_board.render

    # p "  1 2 3 4 "
    # p "A . . . . "
    # p "B . . . . "
    # p "C . . . . "
    # p "D . . . . "
    p "Enter the squares for the Cruiser (3 spaces):"


    cruiserinput = gets.chomp
    if @player_board.valid_placement?(@cruiser, cruiserinput.split(" ")) == false
      p "Try again!"
    
      @player_board.place(@cruiser, cruiserinput.split(" "))
      p @player_board.render(true)
      p "Enter the squares for the Submarine (2 spaces):"
      submarineinput = gets.chomp
      @player_board.place(@submarine, submarineinput.split(" "))
      @player_board.render(true)
      require "pry"; binding.pry
    end

  end

end
