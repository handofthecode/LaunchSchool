class Animal

  def run
    'running!'
  end

  def jump
    'jumping!'
  end
  
    def swim
    'swimming!'
  end
  
end


class Dog < Animal
  
  def speak
    'bark!'
  end

  def fetch
    'fetching!'
  end
end

class Bulldog < Dog
  def swim
    "can't swim."
  end
end

class Cat < Animal
  def swim
    "can't swim."
  end
  def speak
    "meow"
  end
end



teddy = Dog.new
puts teddy.speak           # => "bark!"
puts teddy.swim           # => "swimming!"

bill = Bulldog.new
puts bill.speak
puts bill.swim

wiskers = Cat.new
puts wiskers.swim
puts wiskers.jump