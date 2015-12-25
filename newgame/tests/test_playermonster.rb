require './lib/game.rb'
require 'test/unit'

class TestPlayerMonster < Test::Unit::TestCase

  def test_player_exists?
    assert_equal(defined? Player, "constant")
  end
  def test_moster_exists?
    assert_equal(defined? Monster, "constant")

  end
  def test_player_levelsup?
    me = Player.new("Edozie")
    me.experience += 200
    assert_equal(me.update, 2)
  end
  def test_monster_type
    rato = Monster.new("rat")
    assert_equal(rato.type , "rat" )
  end
  def test_monster_damage
    hum = Monster.new("human_marauder")
    assert_equal(hum.damage,10)
    puts "Damage A OK \n"
  end
  def test_player_taking_damage
    me = Player.new("Edozie")
    rat = Monster.new("rat")
    rat.attack(me)
    assert_equal(me.health , 95)
  end

  def test_battle_sequence
    me = Player.new("Edozie")
    puts "Pre battle health is #{me.health} and pre  battle experience is #{me.experience}"

    human = Monster.new("human_marauder")
    battle = Battle.new(human,me)
    battle.engage
    puts "Post battle health is #{me.health} and post  battle experience is #{me.experience}"
  end

  #add battle test , experience absorbtion ,

end
