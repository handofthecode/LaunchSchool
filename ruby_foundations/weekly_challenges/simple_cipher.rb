class Cipher
  ALPHABET = [*"a".."z"]
  attr_reader :key
  def initialize(key = nil)
    @key = key ? key : generate_key
    @shift_distance = @key.chars.map { |letter| ALPHABET.index(letter) }
    raise ArgumentError if /[A-Z]|\d|\s/.match(key) || key == ""
  end
  
  def encode(text)
    text.chars.map.with_index do |let, idx|
      temp = let.ord + @shift_distance[idx]
      temp -= 26 if temp > 122
      temp.chr
    end.join
  end
  
  def decode(text)
    text.chars.map.with_index do |let, idx|
      temp = let.ord - @shift_distance[idx]
      temp += 26 if temp < 97
      temp.chr
    end.join
  end
  
  private
  
  def generate_key
    100.times.with_object('') { |_, s| s << ALPHABET.sample }
  end
end

# this = Cipher.new
# this.key
