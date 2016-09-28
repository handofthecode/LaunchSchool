flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.each_with_index do |name, index|
  if name.include? "Be"
    p index
  end
end

flintstones.map! {|name| name[0, 3]}

puts flintstones

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones << "Dino"
puts flintstones

advice = "Few things in life are as important as house training your pet dinosaur."
puts advice.slice!(0,advice.index('house'))
puts advice

statement = "The Flintstones Rock!"
p statement.count "t"

title = "Flintstone Family Members"
puts title.center(40)