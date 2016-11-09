class WordProblem
  OPERATORS = { 'plus' => '+', 'minus' => '-', 'divided' => '/', 'multiplied' => '*' }
  def initialize(problem)
    @numbers = problem.scan(/-?\d+/).map(&:to_i)
    @operators = problem.scan(/#{OPERATORS.keys.join('|')}/) .map{ |el| OPERATORS[el] }
    raise ArgumentError if @operators.empty? || @numbers.empty?
  end
  
  def answer
    nums = @numbers.each
    @operators.reduce(nums.next) { |mem, operator| mem.send(operator, nums.next)} 
  end

end
