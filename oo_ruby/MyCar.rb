module Raceable
  def racecar(speed)
    speed > 200 ? true : false
  end
end

class Vehicle
  
  attr_accessor :color
  attr_reader :year, :model
  
  @@number_of_vehicles = 0
  
  def initialize(year, model, color)
    @year = year
    @model = model
    @color = color
    @current_speed = 0  
    @@number_of_vehicles += 1
  end
  
  def self.vehicle_count
    puts "This program has made #{@@number_of_vehicles} vehicles."
  end
  
  def speed_up(speed)
    @current_speed += speed
    puts "speeding up to #{@current_speed}"
  end
  
  def brake(speed)
    @current_speed -= speed
    puts "braking down to #{@current_speed}"
  end
  
  def shut_off
    @current_speed = 0
    puts "Your car sputters to a halt."
  end
    
  def check_speed
    puts "You are going #{@current_speed} MPH!"
  end
  
  def spray_paint(color)
    self.color = color
    puts "You're new #{color} coat looks might fine!"
  end
  
  def mpg(miles, gallons)
    "You got #{miles/gallons} MPH."
  end
  
  def to_s
    "This is a #{year} #{color} #{@model}!"
  end
  
  def age
  "Your #{model} is #{years_old} years old."
  end
  
  private
  
  def years_old
    Time.now.year - year
  end
  
end

class MyCar < Vehicle
  include Raceable
  OFFROAD = false
end

class Truck < Vehicle
  OFFROAD = true
end
  
class Student
  
  def initialize(name, grade)
    @name = name
    @grade = grade
  end
  
  def better_grade_than?(other)
    grade > other.grade
  end
  
  protected 
  
  def grade
    grade = @grade
  end
  
end

joe = Student.new("Joe", "90")

bob = Student.new("Bob", "80")

puts joe.better_grade_than?(bob)




  

# Frank = Truck.new(1985, 'Chevy', 'Black')
# puts Frank

# puts Vehicle.vehicle_count





