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

require "./scenes.rb"

def speech(words)
  puts words
  system("say", words)
end

def speak(words)
  chars = words.chars
  chars.each do |word|
    print word
    sleep(0.05)
  end
end

def speak_fast(words)
  chars = words.chars
  chars.each do |l|
  print l
  sleep(0.01)
  end
end
def stage
  starred_line = ("*"* 100)
  speak_fast(starred_line)
end

class Map
  @@scenes = { "Death" => Death.new,
  "Central_Coridoor" => Central_Coridoor.new,
  "Laser_Weapon_Armory" => Laser_Weapon_Armory.new,
  "The_Bridge" => The_Bridge.new(),
  "Escape_Pod" => Escape_Pod.new(),
  "Finished" => Finished.new()}



  def initialize(start_scene)
    @start_scene = start_scene
  end

  def opening_scene(scene_name)
    return  next_scene(@start_scene)
  end

  #FIND THE NEXT SCENE by matching a string
  def next_scene(scene_name)
    scene = @@scenes[scene_name]
    return scene
  end

end

class Engine

  def initialize(scene_map)
    #start the engine so you can MANIPULATE the MAP use the @scene_map variable
  @scene_map = scene_map
  end

  def play()
    #play  the engine by calling the opening_scene and then setting it to current_scene
    @current_scene = @scene_map.opening_scene("Central_Coridoor")
    @last_scene = @scene_map.next_scene("Finished")
    $score = 0
    def scene_scoring(next_scene_name)


      if next_scene_name != "Death"
        number = 10
        $score += number

      elsif next_scene_name == "Bonus Room"
        number = 20
        $score += number
      else
        number = -1e99
        $score += number
      end

      speak( "\n *** You got #{number} points! *** \n ")
      return next_scene_name
    end



    #set a loop so that it keeps on going going into the next_scene of the
    while @current_scene != @last_scene
      # find the name of the next scene by ENTERING the scene, every scene that is entered returns a value
      # you automatically enter the scene here, beacuse we are storing you experience into the next_scene_name
      next_scene_name = @current_scene.enter()

      #Move on to the next scene from the string name of the scene, and score the scene that you're entering
      @current_scene = @scene_map.next_scene(scene_scoring(next_scene_name))

    end
    #enter the last scene  beacause the loop stops when current_scene is equal to last_scene
    @current_scene.enter()

  end


end

a_map = Map.new("Central_Coridoor")
a_game = Engine.new(a_map)
a_game.play
