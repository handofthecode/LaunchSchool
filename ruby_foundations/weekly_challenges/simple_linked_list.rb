class SimpleLinkedList
  attr_reader :head

  def empty?
    head.nil?
  end
  
  def size
    self.dup.to_a.count
  end

  def push(datum)
    @head = Element.new(datum, @head)
  end

  def peek
    @head.datum if @head
  end

  def pop
    popped = @head.datum
    @head = @head.next
    popped
  end

  def self.from_a(arr)
    list = SimpleLinkedList.new
    arr.nil? ? (return list) : arr1 = arr.dup
    list.push(arr1.pop) while !arr1.empty?
    list
  end
  
  def to_a
    array = []
    array.push pop while !empty?
    array
  end
  
  def reverse
    SimpleLinkedList.from_a(self.to_a.reverse)
  end
end

class Element
  attr_reader :datum, :next
  def initialize(num, next_element = nil)
    @datum = num
    @next = next_element
  end
  
  def tail?
    @next.nil?
  end
end

l = SimpleLinkedList.from_a([1, 2])
   p l.size
   p l.peek
   p l.head.next.datum

