
def num_range()
    puts "pick a number"
    num = gets.chomp.to_i
    case
    when (num < 0)
        return "no negative numbers please"
    when (num < 51 && num >=0)
        return num.to_s + " is between 0 and 50"
    when (num > 50 && num < 101)
        return num.to_s + " is between 50 and 100"
    else
        return num.to_s + " is above 100"
    end
end

puts num_range()
        
        