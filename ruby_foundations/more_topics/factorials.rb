factorials = Enumerator.new do |y|
  total = 1
  increment = 1
  loop do
    total = total * increment
    y << total
    increment += 1
  end
end


6.times { puts factorials.next }

puts factorials.next

# puts factorials.each_with_index { |num, i| puts num if i < 7}


# factorial = Enumerator.new do |yielder|
#   accumulator = 1
#   number = 0
#   loop do
#     accumulator = number.zero? ? 1 : accumulator * number
#     yielder << accumulator
#     number += 1
#   end
# end

# 7.times { puts factorial.next }

# # factorial.rewind

# factorial.each_with_index do |number, index|
#   puts number
#   break if index == 6
# end