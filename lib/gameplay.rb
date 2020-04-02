require './lib/board.rb'
require './lib/cell.rb'
require './lib/ship.rb'

class Gameplay
  def initialize

  end

  def start
    puts "=============WELCOME TO BATTLESHIP!============="
    puts "Enter battle to play or Q to quit."

    battle = gets.chomp

    if battle == "battle"
          @computer_board = Board.new
          @player_board = Board.new
          @cruiser = Ship.new("Cruiser", 3)
          @submarine = Ship.new("Submarine", 2)
          place_computers_ships
          place_human_player_ships
          turn

        else
          puts "We are in the midst of a pandemic...games are your only option."
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

  end

  def place_human_player_ships
    @player_board = Board.new
    puts "I, the computer, have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."
    puts @player_board.render
    puts "Enter the squares for the Cruiser (3 spaces):"

    coordinates_validated = false
    cruiserinput = nil
    until coordinates_validated == true
      cruiserinput = gets.chomp
      coordinates_validated = @player_board.valid_placement?(@cruiser, cruiserinput.upcase.split(" "))
      if coordinates_validated == false
        p "Those are invalid coordinates. Please try again:"
      end
    end

      @player_board.place(@cruiser, cruiserinput.upcase.split(" "))
      puts @player_board.render(true)

      p "Enter the squares for the Submarine (2 spaces):"

      coordinates_validated = false
      subinput = nil
      until coordinates_validated == true
         subinput = gets.chomp
         coordinates_validated = @player_board.valid_placement?(@submarine, subinput.upcase.split(" "))
         if coordinates_validated == false
           p "Those are invalid coordinates. Please try again:"
         end
      end

      @player_board.place(@submarine, subinput.upcase.split(" "))
    end

    def turn
      render_boards

      p "Enter the coordinate for your shot:"

      shot_coordinate = get_coordinate_from_player
      @computer_board.fire_upon(shot_coordinate)

      random_shot_coordinate = get_random_coordinate
      @player_board.fire_upon(random_shot_coordinate)

      render_boards
    end

    def render_boards
      puts "=============COMPUTER BOARD============="
      puts @computer_board.render

      puts "==============PLAYER BOARD=============="
      puts @player_board.render(true)
    end

    def get_coordinate_from_player
      coordinate_validated = false
      shot_coordinate = nil
      until coordinate_validated == true
        shot_coordinate = gets.chomp.upcase

        coordinate_validated = @computer_board.valid_coordinate_shot?(shot_coordinate)
        if coordinate_validated == false
          p "Please enter a valid coordinate:"
        end
      end
      shot_coordinate
    end

    def get_random_coordinate
      coordinate_validated = false
      random_shot_coordinate = nil
      until coordinate_validated == true
        random_shot_coordinate = @player_board.cells.keys.sample
        coordinate_validated = @player_board.cells.include?(shot_coordinate)
      end
      random_shot_coordinate
    end
  end
