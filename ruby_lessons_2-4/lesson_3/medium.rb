=begin phrase = "The Flintstones Rock!"

5.times { |num| puts (" " * num) + phrase }

letter_quantity = {}

phrase.chars.each do |char| 
  if !letter_quantity.has_key?(char)
  num = phrase.count(char) 
  letter_quantity[char] =  num
  end
end

puts letter_quantity
=end



def fib(first_num, second_num, limit)
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
    puts sum
  end
end

fib(0, 1, 15)
