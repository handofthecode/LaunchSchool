class House
  
  def self.recite
    House.new.sing
  end
  
  def sing
    @lyrics = pieces.reverse
    song = ''
    @lyrics.size.times { |index| song << paragraph(index) }
    song.chomp
  end
  
  private
  
  def paragraph(index)
    stanza = "This is "
    first = true
    index.downto(0) do |idx| 
      if idx == 11 || first == true
        stanza << @lyrics[idx][0]
        first = false
      else
        stanza << @lyrics[idx + 1][1] << " " << @lyrics[idx][0]
      end
      stanza << "." if idx == 0
      stanza << "\n" 
    end
    stanza << "\n"
  end
  
  def pieces
    [
      ['the horse and the hound and the horn', 'that belonged to'],
      ['the farmer sowing his corn', 'that kept'],
      ['the rooster that crowed in the morn', 'that woke'],
      ['the priest all shaven and shorn', 'that married'],
      ['the man all tattered and torn', 'that kissed'],
      ['the maiden all forlorn', 'that milked'],
      ['the cow with the crumpled horn', 'that tossed'],
      ['the dog', 'that worried'],
      ['the cat', 'that killed'],
      ['the rat', 'that ate'],
      ['the malt', 'that lay in'],
      ['the house that Jack built']
    ]
  end
end