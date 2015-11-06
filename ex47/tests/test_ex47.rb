require "./game.rb"
require "test/unit"



class TestGame < Test::Unit::TestCase

    def test_room()
        puts "Hello World ! "
        puts "I am really working "
        puts Room.method_defined? :go
        puts Room.new("a +b ", "b+c").inspect
        gold = Room.new("GoldRoom",
                    """This room has gold in it you can grab. There's a
                door to the north.""")

        assert_equal("GoldRoom", gold.name)
        assert_equal({}, gold.paths)
    end

    def test_room_paths()
        center = Room.new("Center", "Test room in the center.")
        north = Room.new("North", "Test room in the north.")
        south = Room.new("South", "Test room in the south.")

        center.add_paths({'north'=> north, 'south'=> south})
        assert_equal(north, center.go('north'))
        assert_equal(south, center.go('south'))

    end

    def test_more_room_paths()
      first = Room.new("First", "This room is the first room that you find
       yourself in there is a room to the north and to the south ")
       north = Room.new ("north", "This room seems like it is a place to store
       dead bodies you feel a cold chill down the back of your spine")
       south = Room.new ("south", "There is bountiful amounts of gold in these rooms")

       first.add_paths({"north"=> north, "south" => south})
      north.add_paths({"south" => first})
      south.add_paths("north" => first)

      assert_equal(first.go("north").go("south"), first)
       
    end

    def test_map()
        start = Room.new("Start", "You can go west and down a hole.")
        west = Room.new("Trees", "There are trees here, you can go east.")
        down = Room.new("Dungeon", "It's dark down here, you can go up.")

        start.add_paths({'west'=> west, 'down'=> down})
        west.add_paths({'east'=> start})
        down.add_paths({'up'=> start})

        assert_equal(west, start.go('west'))
        assert_equal(start, start.go('west').go('east'))
        assert_equal(start, start.go('down').go('up'))
    end
end
