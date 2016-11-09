class Phrase
  def initialize(words)
    @words = words.downcase.gsub(/((\s'|'\s)|[^\w'\d]+)/, ' ').squeeze(" ").split
  end
  
  def word_count
    result = {}
    @words.each { |w| result.include?(w) ? result[w] += 1 : result[w] = 1 }
    result
  end
end