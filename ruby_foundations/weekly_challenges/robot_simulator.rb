class Robot
  DIRECTIONS = [:north, :east, :south, :west].freeze
  attr_reader :coordinates
  def initialize
    @coordinates = [0, 0]
    @bearing = 0
  end

  def orient(input)
    DIRECTIONS.include?(input) ? @bearing = DIRECTIONS.index(input) :
                                 (raise ArgumentError)
  end

  def turn_right
    @bearing = @bearing == 3 ? 0 : @bearing + 1
  end

  def turn_left
    @bearing = @bearing == 0 ? 3 : @bearing - 1
  end

  def advance                                 ##if bearing is east: +1, west: -1 
    [3, 1].include?(@bearing) ? @coordinates[0] += 2 <=> @bearing :
                                @coordinates[1] += 1 <=> @bearing
  end

  def bearing
    DIRECTIONS[@bearing]
  end

  def at(*location)
    @coordinates = location
  end
end

class Simulator
  def instructions(o)
    o.chars.map {|c|{'L' => :turn_left, 'R' => :turn_right, 'A' => :advance}[c]}
  end

  def place(robot, location)
    robot.at location[:x], location[:y]
    robot.orient location[:direction]
  end

  def evaluate(robot, commands)
    instructions(commands).each { |command| robot.send command }
  end
end
