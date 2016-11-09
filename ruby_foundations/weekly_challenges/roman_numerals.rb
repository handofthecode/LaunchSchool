class Fixnum
  def to_roman
    result = []
    self.to_s.reverse.chars.each_with_index do |int, pow|
      actual = int.to_i * 10**pow
      result << case actual
      when 1, 2, 3
        'I' * actual
      when 4
        'IV'
      when 5, 6, 7, 8
        'I' 'V' + 'I' * (actual - 5)
      when 9
        'IX'
      when 10, 20, 30 
        'X' * (actual/10)
      when 40
        'XL'
      when 50, 60, 70, 80
        'L' + ('X' * ((actual - 50)/10))
      when 90
        'XC'
      when 100, 200, 300
        'C' * (actual/100)
      when 400
        'CD'
      when 500, 600, 700, 800
        'D' + ('C' * ((actual - 500)/100))
      when 900
        'CM'
      when 1000, 2000, 3000
        'M' * (actual/1000)
      end
    end
    result.reverse.join
  end
end
