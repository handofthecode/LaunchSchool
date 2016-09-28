def is_a_number? (string)
  string.to_i.to_s == string
end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4 
  
  while dot_separated_words.size > 0
    word = dot_separated_words.pop
    return false if !is_a_number?(word)
  end
  return true
end

puts dot_separated_ip_address?("10.4.5.11")
