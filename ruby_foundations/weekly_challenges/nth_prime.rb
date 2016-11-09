class Prime
  def self.nth(idx)
    raise ArgumentError if idx < 1
    primes, top = [2], 3

    while idx > primes.size
      primes << top unless primes.any? do |num| 
      break if num > top/2
      top % num == 0
    end
      top += 2
    end
    primes[-1]
  end
end
