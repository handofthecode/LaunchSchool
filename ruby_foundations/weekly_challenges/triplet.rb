class Triplet
  def self.where(parameters)
    max = parameters[:max_factor] || 10
    min = parameters[:min_factor] || 1
    sum = parameters[:sum]
    detect_pythagoreans(max, min, sum)
  end
  
  def self.detect_pythagoreans(max, min, sum)
    obj_arr = [*min..max].permutation(3).map(&:sort).uniq.map {|a| Triplet.new(a)}
    if sum 
      obj_arr.select {|tri| tri.sum == sum && tri.pythagorean? }
    else 
      obj_arr.select {|tri| tri.pythagorean? }
    end
  end

  def initialize(*args)
    @sides = args.flatten
  end
  
  def sum
    @sides.reduce(:+)
  end
  
  def product
    @sides.reduce(:*)
  end
  
  def pythagorean?
    @sides[0]**2 + @sides[1]**2 == @sides[2]**2 
  end
  
end
