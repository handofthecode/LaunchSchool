def find_value(hash)
    puts "type enter value to search hash"
    value = gets.chomp
    isnumber = value.to_i
    if isnumber.to_s == value
        puts hash.has_value?(value.to_i)
    else 
        puts hash.has_value?(value)
    end
end

h = { "a" => "bunny", "b" => 200, "c" => 300 }
find_value(h)