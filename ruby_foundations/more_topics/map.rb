def map(array)
  array.each_with_object([]) { |el, array| array << yield(el) }
end

p [
map([1, 3, 6]) { |value| value**2 } == [1, 9, 36],
map([]) { |value| true } == [],
map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false],
map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D'],
map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]],
]