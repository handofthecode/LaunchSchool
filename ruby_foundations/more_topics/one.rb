def one?(array)
  counter = 0
  array.each do |el|
    return false if counter > 1
    counter +=1 if yield(el)
  end
  counter == 1 ? true : false
end

p [
one?([1, 3, 5, 6]) { |value| value.even? },    # -> true
one?([1, 3, 5, 7]) { |value| value.odd? },     # -> false
one?([2, 4, 6, 8]) { |value| value.even? },    # -> false
one?([1, 3, 5, 7]) { |value| value % 5 == 0 }, # -> true
one?([1, 3, 5, 7]) { |value| true },           # -> false
one?([1, 3, 5, 7]) { |value| false },          # -> false
one?([]) { |value| true },                     # -> false
]