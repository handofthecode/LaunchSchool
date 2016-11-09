def each_with_index(arr)
  idx = 0
  arr.each { |el| yield(el, idx); idx += 1 }
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]