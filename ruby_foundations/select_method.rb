def select(array)
  result, index, size = [], 0, array.size
  while index < size do
    result << array[index] if yield(array[index])
    index += 1
  end
  result
end

array = select([1,2,3]) { |num| num.odd? }

p array