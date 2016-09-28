class Person
  attr_accessor :first_name, :last_name
  
  def initialize(full_name)
    parse_full_name(full_name)
  end
  
  def name
    @name = first_name + ' ' + last_name
  end
  
  def name=(full_name)
    parse_full_name(full_name)
  end
  
  def parse_full_name(full_name)
     parts = full_name.split
    self.first_name = parts[0]
    self.last_name = parts.size > 1 ? parts[1] : ''
  end
    
  def to_s
    name
  end
end

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"