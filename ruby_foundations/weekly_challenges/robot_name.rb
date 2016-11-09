require 'pry'
class Robot
  @@name_storage = []
  attr_reader :name
  def initialize
    @name = generate_name
    @@name_storage << @name
  end
  
  def generate_name
    loop do
      result = [*"AA".."ZZ"].sample + rand(000..999).to_s
      return result unless @@name_storage.include?(result)
    end
  end
  
  def reset
    @@name_storage.delete(name)
    initialize
  end
end