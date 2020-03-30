require './lib/Cell'
require "pry";

class Board
  attr_reader :cells

  def initialize
    @cells =     {
          "A1" => Cell.new("A1"),
          "A2" => Cell.new("A2"),
          "A3" => Cell.new("A3"),
          "A4" => Cell.new("A4"),
          "B1" => Cell.new("B1"),
          "B2" => Cell.new("B2"),
          "B3" => Cell.new("B3"),
          "B4" => Cell.new("B4"),
          "C1" => Cell.new("C1"),
          "C2" => Cell.new("C2"),
          "C3" => Cell.new("C3"),
          "C4" => Cell.new("C4"),
          "D1" => Cell.new("D1"),
          "D2" => Cell.new("D2"),
          "D3" => Cell.new("D3"),
          "D4" => Cell.new("D4")
        }
  end

  def valid_coordinate?(coordinate)
    @cells.keys.include?(coordinate) && cells[coordinate].ship == nil

  end

  def valid_placement?(ship, coordinates)
    # if coordinates are not the same length as the ship, return false
    if coordinates.count != ship.length
      return false
    end

    # if coordinate are not valid, return false
    is_valid = true
    coordinates.each do |coordinate|
      if valid_coordinate?(coordinate) == false
        is_valid = false
      end
    end
    if is_valid == false
        return is_valid
    end

    coord_letters_ordinals = get_coord_letters(coordinates)
    coord_numbers = get_coord_numbers(coordinates)

    #step 1 check for horizontal placement
    if are_consecutive?(coord_numbers) && are_the_same?(coord_letters_ordinals)
      true
    #step 2 check for vertical placement
    elsif are_consecutive?(coord_letters_ordinals) && are_the_same?(coord_numbers)
      true
    #step 3 not horizontal or vertical return false
    else
      false
    end

  end

  def get_coord_letters(coordinates)
    #return the ordinal value of the letter so we can do consecutive comparison
    #for instance A is 65, B is 66
    coordinates.map do |coordinate|
      coordinate[0].ord
    end
  end

  def get_coord_numbers(coordinates)
    coordinates.map do |coordinate|
      coordinate[-1].to_i
    end
  end

  def are_consecutive?(array)
    is_valid = true
    array[0...-1].each_with_index do |num, index|
      #only iterate over from the first to second to last one
      if array[index + 1] - num != 1
        is_valid = false
      end
    end
    is_valid
  end

  def are_the_same?(array)
    array.uniq.count == 1
  end

  def place(ship, coordinates)
    coordinates.each do |coordinate|
    cells[coordinate].place_ship(ship)
    end
  end

end
