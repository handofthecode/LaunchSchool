class Luhn
  attr_accessor :number
  def initialize(number)
    @number = number.to_s.chars.map(&:to_i)
  end

  def addends(modify = false)
    @number.reverse.map.with_index do |num, idx|
      idx.odd? ? num *= 2 : num
      num >= 10 ? num -=9 : num
    end.reverse
  end

  def checksum
    addends.reduce(:+)
  end

  def valid?
    checksum % 10 == 0
  end

  def self.create(invalid)
    instance = Luhn.new(invalid)
    instance.number << 0
    instance.number[-1] = (10 - instance.checksum % 10) unless instance.valid?
    instance.number.join.to_i
  end
end
