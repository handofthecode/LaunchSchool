def count(array)
  count = 0
  array.each { |el| count += 1 if yield(el) }
  count
end

p [
count([1,2,3,4,5]) { |value| value.odd? } == 3,
count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2,
count([1,2,3,4,5]) { |value| true } == 5,
count([1,2,3,4,5]) { |value| false } == 0,
count([]) { |value| value.even? } == 0,
count(%w(Four score and seven)) { |value| value.size == 5 } == 2,
]