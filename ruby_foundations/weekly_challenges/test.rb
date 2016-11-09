### start time 5:42

# A class is like a mold for objects. All of the methods and characteristics
# that differentiate objects from one another are contained within their classes, 
# parent classes and/or modules. 

# Classes are defined with the key work "class" and terminated with the key word 
# "end".

# Object instances are instantiated by assigning them to the desired class and calling
# the "new" method like so: "new_dog = Dog.new"


# this is a class-->

# class Dog
#   def woof
#     puts "woof"
#   end
# end

# this is an object of that class -->

# fido = Dog.new

# this is that object calling a method -->

# fido.woof



# Class inheritance is when you have a parent class that passes all of it's attributes
# to a subclass. In Ruby this can only done once without the use of "mixins" or modules.

# In this example, Structure is the parent class. House and Teepee both inherit 
# some or all of the attributes of "Structure".
# ```ruby
# class Structure
#   def initialize(doors, floors, color)
#     @doors = doors
#     @floors = floors
#     @color = color
#   end
  
#   def occupied
#     puts "This #{@color} #{self.class} is occupied!"
#   end
# end

# class House < Structure; end

# class Teepee < Structure
#   def initialize(color, material)
#     @color = color
#     @material = material
#   end
# end

# class Tent < Teepee; end

# house = House.new(1, 2, "blue")
# teepee = Teepee.new("brown", "canvas")
# house.occupied
# teepee.occupied
# tent = Tent.new("black", "cotton")

# tent.occupied
# ```

# Classes in ruby can only inherit from one parent class but you can you use modules to 
# share functionality between classes that might not have the same parents.

# Using the ancestors method, available to all objects, you can see that modules 
# attributes take presidence over parent classes.

# ```
# module Woofable
#   def speak
#     puts "woof! woof!"
#   end
# end

# class Living
#   def initialize(favorite_food)
#     @favorite_food = favorite_food
#   end
#   def speak
#     "Hi! I am a #{self.class}!"
#   end
# end

# class Dog < Living
#   include Woofable
# end

# class Robodog
#   include Woofable
# end

# spot = Dog.new("steak")
# pixel = Robodog.new

# spot.speak
# pixel.speak

# puts spot.class.ancestors

# class Person
#   attr_accessor :name

#   def initialize(n)
#     @name = n
#   end

#   def change_info(new_name)
#     self.name = new_name         # invoking the setter method
#   end
# end

# bob = Person.new('bob')
# bob.change_info('Robert')

# puts bob.name

# class Person
#   @@total_people = 0
#   attr_accessor :name, :weight, :height
  
#   def initialize(name, weight, height)
#     @name = name
#     @weight = weight
#     @height = height
#     @@total_people += 1
#   end
  
#   def change_info(name, weight, height)
#     self.name = name
#     self.weight = weight
#     self.height = height
#   end
  
#   def self.total_people
#     @@total_people
#   end
# end

# bob = Person.new('bob', 185, 70)
# Person.total_people       # this should return 1


# module Deligatable
# end

# class Employee
#   def initialize(name, serial_number)
#     @name = name
#     @serial_number = serial_number
#   end
  
#   def print_name
#     puts @name.dup
#   end
# end

# class Executive < Employee
#   include Deligatable
#   def initialize(name, serial_number)
#     super(name, serial_number)
#     @full_time = true
#     @vacation_days = 20
#     @word_space = :corner_office
#   end

#   def print_name
#     puts "Exe " + @name.dup
#   end
# end

# class Manager < Employee
#   include Deligatable
#   def initialize(name, serial_number)
#     super(name, serial_number)
#     @full_time = true
#     @vacation_days = 14
#     @work_space = :private_office
#   end

#   def print_name
#     puts "Mgr " + @name.dup
#   end
# end

# class Regular_employee < Employee
#   def initialize(name, serial_number)
#     super(name, serial_number)
#     @full_time = true
#     @vacation_days = 10
#     @work_space = :cubicle
#   end
# end

# class Part_time < Employee
#   def initialize(name, serial_number)
#     super(name, serial_number)
#     @full_time = false
#     @vacation_days = 0
#     @work_space = :open
#   end
# end

# bob = Part_time.new("bob", 333)
# sam = Executive.new("sam", 555)
# will = Regular_employee.new("fill", 444)
# jill = Manager.new("jill", 111)
# ben = Part_time.new("ben", 000)

# bob.print_name
# sam.print_name
# will.print_name
# jill.print_name
# ben.print_name

# Creating a method that can take a block is useful for keeping methods flexible.
# You may not want to specify all of the implimentation details when writing a method.
# Another good time to consider using blocks is when you need to sandwich code.

# ```ruby
def display_what_happend (name)
  puts "First there was #{name}."
  yield(name)
  puts "Then #{name} went home."
end

display_what_happend('Bob') do |name| 
puts "#{name} got a last name."
name = "Bob Smith"
end

def each(array)
  index, size = 0, array.size
  while index < size do
    yield(array[index])
    index += 1
  end
  array
end

each([1,2,3]) { |num| puts num  }
# ```
