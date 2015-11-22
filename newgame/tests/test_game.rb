require "./lib/game.rb"
require "test/unit"

class TestGame < Test::Unit::TestCase

  def test_sample
    assert_equal(4, 2+2)
  end

  def test_lexicon_exists
    Lexicon.is_a? Module
  end
  def test_lexicon_has_array
    assert_block do
      Lexicon.scan("go north") == [["verb","go"],["direction","north"]]
    end

  end
  def test_room
    nuclear = Scene.new("NuclearShelter")
    pathname = Scene.new("path", "A second path to take")
    nuclear.name == "nuclear"
    nuclear.paths.is_a?(Hash)
    nuclear.add_path({"pathname" => pathname})
    assert_equal(nuclear.go("pathname"),nuclear.paths["pathname"])
  end

  def test_handles_false_route

    nuclear = Scene.new("NuclearShelter")
    assert_equal(nuclear.go("somewhere non existant"),nil)


  end


  def test_path_sequence
    nuclear = Scene.new("The Valut")
    secondoption = Scene.new("The second option")
    thirdoption = Scene.new("The third")

    nuclear.add_path("north" => secondoption)
    secondoption.add_path("south" => nuclear)
    nuclear.add_path("west" => thirdoption)
    thirdoption.add_path("east" => nuclear)

    assert_equal(nuclear.go("west").go("east"),nuclear.go("north").go("south"))

  end
  def test_nuclear_entrance_exists?
    puts "Im entering into the shelter"
    nuclear = NuclearShelter.new()
    assert_respond_to(nuclear, :enter)
  end


  def test_map
    puts "Im testing the map"
    current_scene = Map.new("The Vault").opening_scene
    assert_equal(current_scene, "TheInstitute")

  end

  def test_nulcear_entrance_print
    nuclear = NuclearShelter.new()
    assert_block do
    nuclear.enter == "TheInstitute"
    end

  end


end
