require './lib/game/lexicon.rb'
require 'test/unit'

class TestLexicon < Test::Unit::TestCase


  def test_lexicon_exists
    assert_equal(true, (Lexicon.is_a? Module) )

  end
  def test_scan
    assert_equal(Lexicon.scan("go north"),[["verb","go"],["direction", "north"]])
  end
  def test_direction
    assert_equal(Lexicon.scan("north south east west"),[["direction","north"],["direction","south"],["direction", "east"],["direction","west"]])
  end

  def test_verbs

  end
end
