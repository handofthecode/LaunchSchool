class Bst
  attr_reader :left, :right, :data
  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end

  def insert(num)
    if num <= @data
      @left.nil? ? @left = Bst.new(num) : @left.insert(num)
    else
      @right.nil? ? @right = Bst.new(num) : @right.insert(num)
    end
  end

  def each(&block)
    return to_enum(:each) unless block_given?

    left.each(&block) if left
    yield(data)
    right.each(&block) if right
  end

end

tree = Bst.new(9)
tree.insert 8
tree.insert 8.5
p tree.each.to_a
