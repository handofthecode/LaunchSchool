class PigLatin
  VOWELS = %w(a e i o u)
  VOWEL_SOUNDS = %w(xr yt)
  CONSONANTS = %(b c d f g h j k l m n p q r s t v w x y z)
  QU = 'qu'

  def self.translate(words)
    result = words.split(' ').map do |word|
      trans_consonants(word) unless VOWEL_SOUNDS.include?(word.slice(0..1))
      word << "ay"
    end
     result.join(' ')
  end
  
  def self.trans_consonants(word)
    if word.slice(0..2).include?(QU) && CONSONANTS.include?(word[0])
      word << word.slice!(0..word.index(QU) + 1)
      return
    end
    word.chars.map.with_index do |letter, idx|
      if VOWELS.include?(letter)
        word << word.slice!(0..idx-1)
        break
      end
    end
  end
end

puts PigLatin.translate('square')