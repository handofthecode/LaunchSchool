class Diamond
  def self.make_diamond(letter)
    @column_mapped_letters = [*'A'..letter].reverse.concat([*'B'..letter])
    @size = @column_mapped_letters.size
    row_mapped_letters = [*'A'..letter].concat([*'A'...letter].reverse)

    row_mapped_letters.map { |char| row(char) }.join
  end

  def self.row(letter)
    @size.times.with_object('') do |idx, row|
      row << (@column_mapped_letters[idx] == letter ? letter : ' ')
    end << "\n"
  end
end

puts Diamond.make_diamond "Z"