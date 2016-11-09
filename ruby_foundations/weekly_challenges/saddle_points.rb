class Matrix
  attr_reader :rows, columns
  def initialize(string)
    @matrix = string.split("\n").map { |line| line.split(" ").map(&:to_i) }
    @rows = matrix.dup
    @columns = rows.transpose
  end
  
  def saddle_points
    result = []
    rows.each_with_index do |row, y|
      big = row.reduce { |mem, num| num >= mem ? num : mem }
      xs = row.each_with_object([]).with_index {|(v, a), i| a << i if v == big}
      xs.each { |x| result << [y, x] if columns[x].all? {|num| num >= big} }
    end
    result
  end
end