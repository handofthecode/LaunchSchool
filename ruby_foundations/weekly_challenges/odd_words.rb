class OddWords
  attr_accessor :result
  
  def initialize(string)
    @string = string
    @result = ''
  end
  
  def odd_words
    @string.split(' ').each_with_index do |word, word_index|
      if word == ' ' || word == '.'
        next
      elsif word_index == 0
        print_chars(word)
      else 
        result << ' '
        word_index.odd? ? print_chars(word.reverse) : print_chars(word)
      end
    end
    result << '.'
  end
  
  def print_chars(word)
    word.chars.each { |char| char == '.' ? next : (result << char) }
  end
end
  
  phrase = OddWords.new("   how now brown cow    meow       .").odd_words
  puts phrase.odd_words
