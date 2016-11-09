require 'pry'
class Palindromes
  def initialize(args)
    @range = (args[:min_factor] || 1..args[:max_factor]).to_a
    @palindromes = Hash.new { |hash, key| hash[key] = [] }
  end

  def generate
    permutations = @range.repeated_permutation(2).to_a
    permutations.each { |x, y| @palindromes[x * y] << [x, y] if palendrome?(x * y) }
    @largest = @palindromes.keys.max
    @smallest = @palindromes.keys.min
  end

  def largest
    Struct.new(:value, :factors).new(@largest, @palindromes[@largest])
  end

  def smallest
    Struct.new(:value, :factors).new(@smallest, @palindromes[@smallest])
  end

  def palendrome?(num)
    num.to_s == num.to_s.reverse
  end

end
