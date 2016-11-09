class Banner
  def initialize(message, width = nil)
    raise ArgumentError, "Message won't fit!" if !width.nil? && width < message.length 
    @buffer = width ? ((width - message.length) / 2) : 0
    @message = "| " + (' ' * @buffer) + message + (' ' * @buffer) + " |"
    @width = @message.length
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    '+'+ '-' * (@width - 3) + '-+'
  end

  def empty_line
    "|  " + " " * (@width - 4) + "|"
  end

  def message_line
    @message
  end
end

puts Banner.new('ABcffg', 50)