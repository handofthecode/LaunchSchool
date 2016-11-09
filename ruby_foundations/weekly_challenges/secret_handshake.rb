class SecretHandshake
  def initialize(input)
    @code = input.class == String ? binary_to_decimal(input) : input
  end

  def commands
    commands = []
    reverse = false
    if @code > 16
      @code -= 16
      reverse = true
    end
    if @code >= 8
      @code -= 8 
      commands.unshift 'jump' 
    end
    if @code >= 4
      @code -= 4
      commands.unshift 'close your eyes'
    end
    if @code >= 2
      @code -= 2
      commands.unshift 'double blink'
    end
    if @code == 1
      @code -= 1
      commands.unshift 'wink'
    end
    reverse ? commands.reverse : commands
  end

  def binary_to_decimal(input)
    result = 0
    input.reverse.chars.each_with_index do |el, idx| 
      idx == 0 && el == '1' ? result += 1 : el == '1' ? result += idx * 2 : next
    end
    result
  end
end
