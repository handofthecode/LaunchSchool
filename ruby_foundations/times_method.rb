def times(number)
  count = 0
  while count < number do
    yield(count)
    count +=1 
  end
  number
end

def seewhat
  times(5) do |num|
    puts num
  end
end

puts seewhat

