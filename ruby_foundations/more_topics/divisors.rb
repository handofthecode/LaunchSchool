def divisors(num)
  result = 1.upto(num**0.5).select { |n| num % n == 0 }
  (result + result.map { |val| num / val } ).uniq.sort
end


puts divisors(1) == [1]
puts divisors(7) == [1, 7]
puts divisors(12) == [1, 2, 3, 4, 6, 12]
puts divisors(98) == [1, 2, 7, 14, 49, 98]
time = Time.now
puts divisors(99996200035687878)
puts Time.now - time