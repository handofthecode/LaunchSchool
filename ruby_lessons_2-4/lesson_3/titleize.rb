=begin 

sentence = "one two three four five"

puts sentence.split(" ").map {|word| word.capitalize!}.join(" ")

=end

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

=begin 
munsters.each_key do |key| 
  if munsters[key]["age"] < 18
    munsters[key]["age_group"] = "kid"
  elsif munsters[key]["age"] < 64
    munsters[key]["age_group"] = "adult"
  else
    munsters[key]["age_group"] = "senior"
  end
end

puts munsters


munsters.each do |name, details| 
  case details["age"]
  when 0...17
    details["age_group"] = "kid"
  when 18...64
    details["age_group"] = "adult"
  else
    details["age_group"] = "senior"
  end
end

puts munsters
=end
