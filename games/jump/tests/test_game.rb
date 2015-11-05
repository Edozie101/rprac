require "./game.rb"
require "test/unit"

class TestGame < Test::Unit::TestCase


  def test_window
    w = Window.new
    assert_equal(Gosu::Image.new("space.jpg"),w.background_image)
  end


end
