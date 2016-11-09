def any?(array)
  array.each { |el| return true if yield(el) }
  false
end


any?([1, 3, 5, 6]) { |value| value.even? } == true
any?([1, 3, 5, 7]) { |value| value.even? }
any?([2, 4, 6, 8]) { |value| value.odd? } == false
any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
any?([1, 3, 5, 7]) { |value| true } == true
any?([1, 3, 5, 7]) { |value| false } == false
any?([]) { |value| true } == false