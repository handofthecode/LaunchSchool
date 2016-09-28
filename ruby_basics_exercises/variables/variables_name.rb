puts "please enter your first name."
nameFirst = gets.chomp
puts "please enter your last name."
nameLast = gets.chomp
puts "Hello " + nameFirst + " " + nameLast + ". How are you today? Don't answer that."

10.times do |n|
    puts nameFirst + " " + nameLast
end