def each(array)
  index, size = 0, array.size
  while index < size do
    yield(array[index])
    index += 1
  end
  array
end

each([1,2,3]) { |num| puts num  }