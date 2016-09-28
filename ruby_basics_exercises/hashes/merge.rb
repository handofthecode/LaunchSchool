h1 = { "a" => 100, "b" => 200 }
h2 = { "b" => 254, "c" => 300 }

puts "Here are two 'hashes', h1 and h2"
sleep(1)
p h1
p h2
sleep(1)
puts "press 1 to merge and see the results of both hashes"
sleep(1)
puts "OR press 2 to 'merge!' and see the results of both hashes"
exit = 0
while exit == 0
    answer = gets.chomp.to_i
    if answer == 1
        h1.merge(h2)
        p h1
        p h2
        h1 = { "a" => 100, "b" => 200 }
        h2 = { "b" => 254, "c" => 300 }
    
    elsif answer == 2
        h1.merge!(h2)
        p h1
        p h2
    
    elsif answer == 0
        exit = 1
    end
end
             