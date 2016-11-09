require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  # Your tests go here. Remember they must start with "test_"

  def test_to_a
  assert_equal(@todos, @list.to_a)
  end
  
  def test_size
    assert_equal(3, @list.size)
  end
  
  def test_first
    assert_equal(@todo1, @list.first)
  end
  
  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    todo_test = @list.shift
    assert_equal(@todo1, todo_test)
    assert_equal([@todo2, @todo3], @list.to_a)
  end
  
  def test_pop
    todo_test = @list.pop
    assert_equal(@todo3, todo_test)
    assert_equal([@todo1, @todo2], @list.to_a)
  end
  
  def test_done
    @list.done!
    assert(@list.done?)
  end
  
  def test_TypeError
    assert_raises(TypeError){@list << 1}
    assert_raises(TypeError){@list << "hi"}
    assert_raises(TypeError){@list << [1,2]}
    assert_raises(TypeError){@list << {a: 1, b: 2}}
    assert_raises(TypeError){@list << nil}
    assert_raises(TypeError){@list << true}
  end
  
  def test_aliase
    todo = Todo.new("test")
    assert_equal(@list << todo, @list.add(todo))
  end
  
  def test_index_at
    assert_equal(@list.item_at(0), @todo1)
    assert_raises(IndexError) {@list.item_at(3)}
  end
  
  def test_mark_done_at
    @list.mark_done_at(1)
    assert @list.item_at(1).done?
  end
  
  def test_mark_undone_at
    @list.done!
    @list.mark_undone_at(1)
    assert !@list.item_at(1).done?
  end
  
  def test_done_bang
    @list.mark_all_undone
    assert !@list.done?
    @list.done!
    assert @list.done?
  end
  
  def test_remove_at
    assert_equal(@todo2, @list.remove_at(1))
    assert_equal([@todo1, @todo3], @list.to_a)
    assert_raises(IndexError) {@list.remove_at(5)}
  end
  
  def test_to_s
    output = <<-OUTPUT
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT
    assert_equal(output.chomp.gsub((/^\s+/), ""), @list.to_s)
    
    @list.mark_done_at(0)
    output = <<-OUTPUT
    ---- Today's Todos ----
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT
    assert_equal(output.chomp.gsub((/^\s+/), ""), @list.to_s)
    
        @list.done!
    output = <<-OUTPUT
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT
    assert_equal(output.chomp.gsub((/^\s+/), ""), @list.to_s)
  end
  
  def test_each
    result = "kmm"
    test = ""
    @list.each { |todo| test << todo.to_s[-1] }
    assert_equal(result, test)
    
    assert_equal(@list.each { |el| nil }, @list)
  end
  
  def test_select
    selected = @list.select { |todo| todo.to_s.include?("o") }
    refute_equal(selected, [@todo2, @todo3])
    assert_equal(selected.to_a, [@todo2, @todo3])
  end
  
  
  
end

# Assertion	Description
# assert(test)	Fails unless test is truthy.
# assert_equal(exp, act)	Fails unless exp == act.
# assert_nil(obj)	Fails unless obj is nil.
# assert_raises(*exp) { ... }	Fails unless block raises one of *exp.
# assert_instance_of(cls, obj)	Fails unless obj is an instance of cls.
# assert_includes(collection, obj)	Fails unless collection includes obj.