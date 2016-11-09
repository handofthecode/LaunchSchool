class RunLengthEncoding
  def self.encode(input)
    result, count = '', 0
    input.chars.each_with_index do |char, idx|
      if char == result[-1]
        count += 1
        result.insert(-2, count.to_s) if idx == input.size - 1
      else
        result.insert(-2, count.to_s) if count > 1
        result << char
        count = 1
      end
    end
    result
  end
  
  def self.decode(input)
    number = [*"1".."99"]
    result, multiplyer = '', ''
    input.chars.each do |char|
      if number.include?(char) 
        multiplyer << char
      else
        multiplyer == '' ? result << char : result << char * multiplyer.to_i
        multiplyer = ''
      end
    end
    result
  end
end