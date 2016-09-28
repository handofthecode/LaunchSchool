jimbo = {name: 'Jim', job: 'scientist', bike: 'red', house: 'big'}

def print_keys_values(hash)
    puts "press 1 to print keys"
    sleep(1)
    puts "OR 2 to print values"
    sleep(1)
    puts "OOOOR 3 to print both keys and values"
    puts "press 0 to exit"
    exit = 0
    while exit == 0
        input = gets.chomp.to_i
        if input == 1
             hash.each_key { |key| puts key }
        elsif input == 2
             hash.each_value { |value| puts value }
        elsif input == 3
            hash.each { |k,v| puts "His #{k} is #{v}" }
        elsif input == 0
            exit = 1
        end
    end
end

print_keys_values(jimbo)

    