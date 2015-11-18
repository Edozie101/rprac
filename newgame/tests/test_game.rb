require "./lib/game.rb"
require "test/unit"

class TestGame < Test::Unit::TestCase

  def test_sample
    assert_equal(4, 2+2)
  end

  def test_room
    nuclear = Scene.new("NuclearShelter")
    pathname = Scene.new ("path", "A second path to take")
    nuclear.name == "nuclear"
    nuclear.paths.is_a?(Hash)
    nuclear.add_path({"pathname" => pathname})
    assert_equal(nuclear.go("pathname"),goldroom.paths["pathname"])

  end

  def test_nuclear_entrance_exists?
    nuclear = NuclearShelter.new()
    assert_respond_to(nuclear, :enter)
  end

  def test_nulcear_entrance_print
    nuclear = NuclearShelter.new()
    assert_block do
    nuclear.enter == "You have entered into the Nuclear Shelter."
    end

  end


end
