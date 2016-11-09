class RailFenceCipher
  def self.encode(string, rail) RailFenceCipher.new(string, rail).encode; end
  def self.decode(string, rail) RailFenceCipher.new(string, rail).decode; end

  def initialize(string, rail)
    @rail, @string = rail, string
    @length = string.size - 1
    @skips = calculate_skips(@length, rail)
  end

  def encode
    return '' if @string == ''
    return @string if @rail > @length

    result = ''
    @skips.each_with_index do |group, i|
      idx = i
      result << @string.slice(idx)  # char from the first spike
      group.each do |skip|
        idx += skip
        result << @string.slice(idx)
      end
      idx += 1
    end
    result
  end

  def decode
    return '' if @string == ''
    return @string if @rail > @length

    result = Array.new(@length)
    @skips.each_with_index do |group, i|
      idx = i
      result[idx] = @string.slice!(0)
      group.each do |skip|
        idx += skip
        result[idx] = @string.slice!(0)
      end
      idx += 1
    end
    result.join
  end

  private

  def calculate_skips(length, rail)
    skip_array = []
    max_spike = rail > 2 ? rail * 2 - 2 : rail
    current_spike = max_spike
    while current_spike >= 0
      skip_array << []
      if current_spike.zero? || current_spike == max_spike
        (length/max_spike).times { skip_array.last << max_spike }
      elsif current_spike < max_spike
        counter_spike = max_spike - current_spike
        temp_length = length
        spike = current_spike   ### spike alternates between current and counter
        loop do
          temp_length -= spike
          break if temp_length < 0
          skip_array.last << spike
          spike = current_spike ? counter_spike : current_spike
        end
      end
      current_spike -= 2
      length -= 1
    end
    skip_array
  end
end
