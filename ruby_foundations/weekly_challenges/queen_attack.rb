class Queens
  attr_reader :white, :black, :wy, :wx, :by, :bx
  def initialize(position = {white: [0, 3], black: [7, 3]})
    @white = position[:white]
    @black = position[:black]
    @wy, @wx, @by, @bx = *white, *black
    raise ArgumentError, "Queens cannot occupy the same space" if white == black
  end

  def to_s
    array = Array.new(8) {"_ _ _ _ _ _ _ _"}
    array[by][bx*2] = "B"
    array[wy][wx*2] = "W"
    array.join("\n")
  end

  def attack?
    bx == wx || by == wy || (by - wy).abs == (bx - wx).abs
  end
end

# queens = Queens.new()
#     p queens.white
#     p queens.black
#     puts queens.to_s