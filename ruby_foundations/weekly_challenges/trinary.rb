class Trinary
  
  def initialize(string)
    @tri_r = string.chars.grep(/[0-2]/).join() == string ? string.reverse : '0'
  end

  def to_decimal
    result = 0
    @tri_r.each_char.with_index { |num, pow| result += (num.to_i * 3**pow) }
    result
  end
end
  
  trinary = Trinary.new('2102')
  puts trinary.to_decimal