
def adder()
    puts "add numbers by entering them and pressing enter. Press EXIT to exit!"
    num = ""
    total = 0
    until num == "EXIT"
        num = gets.chomp
        total += num.to_i
    end
    return "Your sum is: " + total.to_s
end
puts adder()
    
    