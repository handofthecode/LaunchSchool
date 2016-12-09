class Car
  attr_accessor :wheels
  def initialize
    @wheels = 4
  end

  def drive
    puts "Time to drive on all #{wheels} wheels!"
  end
end

car = Car.new

car.drive
puts self