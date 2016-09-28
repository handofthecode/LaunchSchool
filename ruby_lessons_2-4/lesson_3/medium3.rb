=begin
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" }
}

total_age = 0
munsters.each do |name, details|
  case details["gender"]
  when "male"
    total_age += details["age"]
  end
end
puts total_age


total_age = 0
munsters.each do |name, details|
  if details["gender"] == "male"
    total_age += details["age"]
  end
end
puts total_age



=begin
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, details|

puts "#{name} is a #{details["age"]} year old #{details["gender"]}."
end

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]
  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"



sentence = "Humpty Dumpty sat on a wall."
array = []
sentence.split(/\W/).each { |word| array.unshift(word) }
puts array.join(' ') + "."

answer = 42

def mess_with_it(some_number)
  if true
    some_number += 8
  else
    some_number += -2
  end
end

mess_with_it(answer)

p answer - 8



munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  new_hash = demo_hash
  new_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
    return new_hash
  end
end

messy = mess_with_demographics(munsters)

puts munsters

puts messy


def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga'
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

=end