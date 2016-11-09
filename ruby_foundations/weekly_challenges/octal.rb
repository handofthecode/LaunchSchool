class Octal
  
  def initialize(string)
    @oct_r = string.chars.grep(/[0-7]/).join() == string ? string.reverse : '0'
  end

  def to_decimal
    result = 0
    @oct_r.each_char.with_index { |num, pow| result += (num.to_i * 8**pow) }
    result
  end
end
  
  octal = Octal.new('8')
  puts octal.to_decimal