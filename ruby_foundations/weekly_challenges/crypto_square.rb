class Crypto

  def initialize(message)
    @normalize_plaintext = message.downcase.gsub(/[^a-z\d]/, '')
    @size = (@normalize_plaintext.size**0.5).ceil
  end
  attr_reader :normalize_plaintext, :size
  
  def plaintext_segments
    normalize_plaintext.scan(/.{1,#{size}}/)
  end

  def ciphertext(space = '')
    result = ''
    array = plaintext_segments
    array[0].size.times do        ## number of columns
      array.size.times do |idx|   ## number of rows
        result << array[idx].slice!(0) unless array[idx] == ''
      end
      result << space
    end
    result
  end
  
  def normalize_ciphertext
    ciphertext(' ').rstrip
  end
end

# crypto = Crypto.new('Have a nice day. Feed the dog & chill out!')
#     # expected = 'hifei acedl veeol eddgo aatcu nyhht'
# puts crypto.normalize_ciphertext.flatten