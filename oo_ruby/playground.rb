def missing(array)
  (array[0]..array[-1]).select { |num| !array.include?(num) }
end
  

puts missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
puts missing([1, 2, 3, 4]) == []
puts missing([1, 5]) == [2, 3, 4]
puts missing([6]) == []