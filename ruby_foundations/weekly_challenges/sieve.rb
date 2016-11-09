class Sieve
  
  def initialize(highest)
    @range = (2..highest).to_a
  end
  
  def primes
    result = []
    while !@range.empty?
      result << @range.delete_at(0)
      @range.each { |num| @range.delete(num) if num % result[-1] == 0 }
    end
    result
  end
end

sieve = Sieve.new(100)
p sieve.primes