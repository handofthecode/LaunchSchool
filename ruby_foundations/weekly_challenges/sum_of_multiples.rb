class SumOfMultiples
  
  def initialize(*multiples)
    @multiples = multiples
  end
    
  def self.to(upto, multiples = [3, 5])
    result = []
    multiples.each do |num| 
      temp = num
      while num < upto
        result << num
        num += temp
      end
    end
    answer = result.uniq.reduce(&:+)
    answer ? answer : 0
  end
  
  def to(upto)
    self.class.to(upto, @multiples)
  end
end

puts SumOfMultiples.new(1, 2).to(6)

