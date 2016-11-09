class House
  
  def self.recite
    House.new.sing
  end
  
  def sing
    song = ''
    -1.downto(-pieces.size) { |lines| song << paragraph(lines) }
    song.chomp
  end
  
  def paragraph(l)
    "This is " << pieces[l, l.abs].map { |c| c.join("\n") }.join(' ') << ".\n\n"
  end
  
  private
  
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

House.recite