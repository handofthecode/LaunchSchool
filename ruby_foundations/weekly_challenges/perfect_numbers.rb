class PerfectNumber
  def self.classify(number)
    raise RuntimeError if number < 2
    divisors = (1..(number/2+1)).to_a.select { |div| number % div == 0 }
    ["perfect", "abundant", "deficient"][divisors.reduce(:+) <=> number]
  end
end

