require 'minitest/autorun'
require_relative 'text'
class TextTest < Minitest::Test

  def setup
    @file = File.open('./sample_text.txt', 'r')
  end
  
  def test_swap
    text = Text.new(@file.read)
    actual_text = text.swap('s', 'sh')
    expected_text = <<~TEXT
    Lorem ipshum dolor shit amet, conshectetur adipishcing elit. Crash shed vulputate ipshum.
    Sushpendishshe commodo shem arcu. Donec a nishi elit. Nullam eget nishi commodo, volutpat
    quam a, viverra maurish. Nunc viverra shed mashsha a condimentum. Sushpendishshe ornare jushto
    nulla, shit amet mollish erosh shollicitudin et. Etiam maximush moleshtie erosh, shit amet dictum
    dolor ornare bibendum. Morbi ut mashsha nec lorem tincidunt elementum vitae id magna. Crash
    et variush maurish, at pharetra mi.
    TEXT
    assert_equal actual_text, expected_text
  end
  
  def test_word_count
    text = Text.new(@file.read)
    assert_equal text.word_count, 72
  end
  
  def teardown
    @file.close
    puts "File has been closed: #{@file.closed?}"
  end
  
end
