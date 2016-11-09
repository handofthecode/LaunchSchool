class Anagram
  def initialize(det)
    @det = det.downcase
  end
  
  def match(words)
    det = @det.chars.sort
    ids = words.map.with_index { |w, i| w.downcase.chars.sort == det ? i : nil }
    ids.compact.map { |i| words[i] }.reject { |w| w.downcase == @det }
  end
end