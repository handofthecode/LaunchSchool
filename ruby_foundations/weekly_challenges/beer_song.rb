class BeerSong
  
  def verse(num, final_beer = num)
    lyrics(num, final_beer)
  end
  alias_method :verses, :verse
  
  def lyrics(num = 99, final_beer = 0)
    song = []
    while num > final_beer - 1 && num > 2
      song << "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
      "Take one down and pass it around, #{num - 1} bottles of beer on the wall.\n"
      num -= 1
    end
    if num >= final_beer && num > 1
      song << "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"
      num -= 1
    end
    if num >= final_beer && num > 0
      song << "1 bottle of beer on the wall, 1 bottle of beer.\n" \
    "Take it down and pass it around, no more bottles of beer on the wall.\n"
      num -= 1
    end
    if num >= final_beer && num == 0
      song << "No more bottles of beer on the wall, no more bottles of beer.\n" \
    "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
      num -= 1
    end
    song.join("\n")
  end
end
