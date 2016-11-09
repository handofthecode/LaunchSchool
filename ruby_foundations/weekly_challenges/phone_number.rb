class PhoneNumber
  def initialize(number)
    @number = number.gsub(/[^\w\d]/, '')
  end

  def number
    return '0000000000' if @number.match(/[^\d]/)
    return @number if @number.size == 10
    return @number[1..10] if @number[0] == '1' && @number.size == 11
    '0000000000'
  end

  def area_code
    number[0..2]
  end

  def to_s
    "(#{number[0..2]}) #{number[3..5]}-#{number[6..9]}"
  end
end
