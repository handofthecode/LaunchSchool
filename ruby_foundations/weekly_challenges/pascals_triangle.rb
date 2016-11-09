class Triangle
  def initialize(row_count)
    @row_count = row_count
    @rows = []
  end
  
  def rows
    (1..@row_count).each { |num| @rows << Array.new(num) }
    @rows.each_with_index do |arr, index|
      arr.each_index do |idx|
        arr[idx] = idx.zero? || idx == arr.size - 1 ? 
          1 : @rows[index - 1][idx - 1] + @rows[index-1][idx]
      end
    end
  end
end

p Triangle.new(20).rows.last