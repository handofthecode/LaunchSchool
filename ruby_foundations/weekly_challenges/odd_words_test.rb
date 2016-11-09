require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!
require_relative 'odd_words'

class OddWordsTest < Minitest::Test
  def test_extra_spaces
    words = "   how now brown cow    meow       ."
    result = 'how won brown woc meow.'
    assert_equal result, OddWords.new(words).odd_words
  end
end