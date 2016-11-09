def drop_while(x)
  x.each_with_object([]).with_index { |(e, a), i| return x[i..-1] if !yield(e) }
end

p [
drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6],
drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5],
drop_while([1, 3, 5, 6]) { |value| true } == [],
drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6],
drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6],
drop_while([]) { |value| true } == [],
]