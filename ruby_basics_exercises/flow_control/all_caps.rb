def all_caps(string)
    if (string.length > 10)
        return string.upcase
    else 
        return string
    end
end

puts all_caps("hello worlds")
puts all_caps("byTe")