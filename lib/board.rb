require './lib/cell'
require './lib/ship'

class Board
  attr_reader :cells,
              :ships

  def initialize
    @ships = []
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

  def combined_ship_health
    ships.sum(&:health)
  end

  def has_lost?
    combined_ship_health == 0
  end

  def valid_coordinate_placement?(coordinate)
    @cells.keys.include?(coordinate) && cells[coordinate].fired_upon? == false && cells[coordinate].ship == nil
  end

  def valid_coordinate_shot?(coordinate)
    @cells.keys.include?(coordinate)
  end

  def valid_placement?(ship, coordinates)
    if coordinates.count != ship.length
      return false
    end

    is_valid = true
    coordinates.each do |coordinate|
      if valid_coordinate_placement?(coordinate) == false
        is_valid = false
      end
    end
    if is_valid == false
        return is_valid
    end

    coord_letters_ordinals = get_coord_letters(coordinates)
    coord_numbers = get_coord_numbers(coordinates)
    if are_consecutive?(coord_numbers) && are_the_same?(coord_letters_ordinals)
      true
    elsif are_consecutive?(coord_letters_ordinals) && are_the_same?(coord_numbers)
      true
    else
      false
    end
  end

  def get_coord_letters(coordinates)
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
    @ships << ship
    coordinates.each do |coordinate|
      cells[coordinate].place_ship(ship)
    end
  end

  def render(reveal_ship = false)
    rendered_cell = ""
    cells.each do |cell|
       rendered_cell += cell[1].render(reveal_ship) + " "
    end
    "  1 2 3 4 \nA " +rendered_cell[0..7] + "\nB " + rendered_cell[8..15] + "\nC " + rendered_cell[16..23] + "\nD " + rendered_cell[24..33] + "\n"
  end

  def fire_upon(coordinate)
    cells[coordinate].fire_upon
  end
end
