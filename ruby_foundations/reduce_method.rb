def reduce(array, memory = array[0])
  index, size = 0, array.size
  while index < size do
    memory = yield(memory, array[index])
    index += 1
  end
  memory
end

puts reduce([1,2,3]) { |mem, el| mem + el }