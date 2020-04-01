require_relative 'board'
require_relative 'cell'
require_relative 'ship'
require_relative 'gameplay'

class Runner
end

runner = Runner.new
gameplay = Gameplay.new
gameplay.start
