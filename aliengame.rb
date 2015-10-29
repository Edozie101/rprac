#First we need to write about the game and then we need to pick out a few
#of the nouns and verbs relating to the game to pick out some of the
# classes and functions
#
#
# Nouns: , Game, Alien , Player, Scene, Room, Death, Finish, The Central Corridor,
# Laser Weapon Armory, The Bridge , The Escape Pod, Engine , Map
#
# We can see that the Overlaps is Scene and Room , since Death is more of a Scene we
# are going to go with Scene as a Main class. The Engine is what manages the movement of Scene to Scene
# The map is what Draws out each scene and holds a collection of the scenes / rooms
#     *Game
#     *Engine
#       (m) play
#     *Map
#       (m) opening_scene()
#       (m) next_scene()
#     *Scene
#       +enter()
#       -Death
#       -The Central Corridor
#       -Laser Weapon Armory
#       -The Bridge
#       -The Escape Pod
#       -Finished


class Scene
  def enter()
  end
end

class Map

  def initialize(start_scene)

  end

  def opening_scene()


  end

  def next_scene(scene_name)


  end

end

class Engine

  def initialize(scene_map)

  end

  def play()

  end


end

class Central_Coridoor < Scene
  def enter
  end
end


class Laser_Weapon_Armory < Scene
  def enter()
  end

end

class The_Bridge < Scene
  def enter()
  end
end


class Escape_Pod < Scene
  def enter()

  end
end

class Death < Scene
  def enter()

  end
end

class Finished < Scene
  def enter()

  end
end

a_map = Map.new("Central_Coridoor")
a_game = Engine.new(a_map)
a_game.play

