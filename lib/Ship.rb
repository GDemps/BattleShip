class Ship
  attr_reader :name,
              :health,
              :length

  def initialize(name, health)
    @name = name
    @health = health
    @length = 3
  end

  def sunk?
    @health == 0
  end

  def hit
    @health -= 1    
  end
end
