class ValueError < StandardError; end

class Board
  def self.transform(inp)
    check_board(inp)
    arr = inp.map { |l| l.chars.map { |c| c == " " ? 0 : c } }
    
    arr.each_with_index do |row, idx|
      row.each_with_index do |char, i|
        if char == "*"
          [-1, 0, 1].each do |y|
            [-1, 0, 1].each do |x| 
              arr[idx+y][i+x] += 1 if arr[idx+y][i+x].is_a? Fixnum
            end
          end
        end
      end
    end
    arr.map {|row| row.join.gsub(/0/, " ") }
  end

  def self.check_board(inp)
    raise ValueError, "Invalid board!" unless
    inp.all? do |l|
      /\A\+-*\+\z/.match(l) || /\A\|[ *]*\|\z/.match(l) && l.size == inp[0].size
    end
  end
end

 inp = ['+-----+', '|     |', '|   * |', '|     |', '|     |',
           '| *   |', '+-----+']
           
 puts Board.transform(inp)