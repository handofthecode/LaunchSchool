class Series
  def initialize(number)
    @number = number
  end
  
  def slices(length)
    fail ArgumentError.new("Slice is too long.") if length > @number.length
    length = length - 1
    iter = @number.size - length
    result = []
    iter.times { |idx| result << @number[idx..idx+length].chars.map(&:to_i) }
    result
  end
end
