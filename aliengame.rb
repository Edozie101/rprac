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

def speak(words)
  chars = words.chars
  chars.each do |word|
    print word
    sleep(0.05)
  end
end

def stage()
  puts 

end

class Scene
  def enter()
    puts "You have entered a scene which doesnt exist SOWWWWYYYYYY"

    exit(0)

  end

end



class Central_Coridoor < Scene
  def enter
    puts "\n"*3

    speak ( """\tHello weary traveller, I would like to welcome you to the wonderful Central Corridor,
      You see a rusty mace on the side of the Alien metal wall, it looks like it was straight out of Warhammer.

      The Corridor seems to head north you can hear something like people talking down there...

      What do you do ?
     """)
     prompt = ">>>   "
     puts prompt
     input = STDIN.gets.chomp

     if input.include?("north")
       speak("""\nHead north you go but where you will end up you do not know\n
       You find door to your left that says: \'Do not enter ... Or you shall DIE \'\n
       and a door to your right that says : \' Free Food \'

       what do you do ?

        """)
        puts prompt
        input = STDIN.gets.chomp
        if input.include?("left")
          speak("Well you just had to do it ...... ")
          (0..3).each do |a|
            sleep(1)
            print "..."
          end
          speak( """
            The door actually leads to a ladder.

            NXT level

          """)
           return "Laser_Weapon_Armory"
        elsif input.include?("right")
          speak("""Well Well Well you greedy cheap fuck , the food was poison\n  """)
          return "Death"
        end
    elsif input.include?("mace")
      speak( """
      The mace EVAPORATES in your hand and turns into a DEMONIC SNAKE

      MUAHAHAHAHHAAHHAAH
      """)
      return 'Death'

    end
  end
end


class Laser_Weapon_Armory < Scene
  def enter()

    puts "helo world"
    return "The_Bridge"

  end

end

class The_Bridge < Scene
  def enter()
    speak ("WoW")
  end
end


class Escape_Pod < Scene
  def enter()

  end
end

class Death < Scene
  @@deaths = ["You are so bad...my grandma could beat you to a pulp",
  "Well young padiwan, the force simply isnt with you",
  "Thora... is that you ? Never mind I thought you were so bad at Games you played like my Girlfriend",
  " Jesus is needed to save you from your terrible ability to play this game ",
  " Holy fucking shit,  I didnt think the world could suck any more now you had to play this game. "]

  def enter()
    speak("\n\t#{@@deaths.at(rand(@@deaths.length - 1 ))}")
    exit(0)
  end
end

class Finished < Scene
  def enter()
    "CONGRATULATIONS YOU HAVE FINISHED THE GAME! YOU DONT SUCK! "
  end
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
    @score = 0
    def scoring(next_scene_name)


      if next_scene_name != "Death"
        number = 1
        @score += 1

      elsif next_scene_name == "Bonus Room"
        number = 20
        @score += 20
      else
        number = -1e99

      end

      speak( "\n You got #{number} points! ")
    end



    #set a loop so that it keeps on going going into the next_scene of the
    while @current_scene != @last_scene
      # find the name of the next scene by ENTERING the scene, every scene that is entered returns a value
      # you automatically enter the scene here, beacuse we are storing you experience into the next_scene_name
      next_scene_name = @current_scene.enter()
      #Move on to the next scene from the string name of the scene
      @current_scene = @scene_map.next_scene(next_scene_name)

    end
    #enter the last scene  beacause the loop stops when current_scene is equal to last_scene
    @current_scene.enter()

  end


end

a_map = Map.new("Central_Coridoor")
a_game = Engine.new(a_map)
a_game.play
