class KrispyKreme

  def initialize(filling_type, glazing)
    @filling_type = filling_type
    @glazing = glazing
  end
  
  def to_s
    filling_string = @filling_type.nil? ? 'Plain' : @filling_type
    glazing_string = @glazing.nil? ? '' : ' with ' + @glazing
    filling_string + glazing_string
  end
  
end


donut1 = KrispyKreme.new(nil, nil)
donut2 = KrispyKreme.new("Vanilla", nil)
donut3 = KrispyKreme.new(nil, "sugar")
donut4 = KrispyKreme.new(nil, "chocolate sprinkles")
donut5 = KrispyKreme.new("Custard", "icing")

puts donut5
#   => "Custard with icing"