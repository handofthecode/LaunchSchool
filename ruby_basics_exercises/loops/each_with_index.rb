array = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p"]
array.each_with_index do |letter, index|
    puts "#{index + 1}. #{letter}"
end
    
