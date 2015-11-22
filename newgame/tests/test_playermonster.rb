require './lib/game.rb'
require 'test/unit'

class TestPlayerMonster < Test::Unit::TestCase

  def test_player_exists?
    defined? Player == "constant"
  end
  def test_player_levelsup?
    me = Player.new("Edozie")
    me.experience += 200
    assert_equal(me.update, 2)
  end
end
