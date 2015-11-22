require "./lib/game/lexicon.rb"

def computerWrite(words)
  @words = words.split
  @words.each do |letter|
    print letter + " "
    sleep(0.09)
  end
end

def competerSpeak(words)
  system("say", words)
  computerWrite(words)
end

class Npc
  attr_accessor :type, :name, :experience_value, :damage, :ranged
  @@type_values = {
    "rat" => ["rat",33, 5, 0],
    "human_marauder" => ["human_marauder", 50,10,5]

  }
  def initialize(type)
    @type = type
    if @@type_values.has_key?(type)
      @experience_value = @@type_values[type][1]
      @damage = @@type_values[type][2]
      @ranged = @@type_values[type][3]
    end
  end
end

class Monster < Npc
    attr_accessor :type, :name, :experience_value, :damage, :ranged
  def initialize(type)
    super(type)
  end



  def attack(player)
    puts "Starting attack"
    puts player

    puts "#{player.health}"

    player.health -= @damage
  end

end

class Player
  attr_accessor :name,:health,:strength,:perception,:endurance,:charisma,:intelligence, :agility, :luck, :level,:experience
  def initialize(name)
    @name = name
    @strength = 0
    @perception = 0
    @endurance = 0
    @charisma = 0
    @intelligence = 0
    @agility = 0
    @luck = 0
    @level = 1
    @experience = 0
    @health  = 100
  end



  def add_exp(monster)
    @experience += monster.exp

  end

  def update
    if @experience % (@level * 200 ) == 0
       @level += 1
       self.levelup
       return @level
    end


  end



  def levelup
    competerSpeak ("Congratulations you just leveled up ")

  end
end


class Scene
  attr_reader :name,:description,:paths,:intro
  def initialize(name,description=nil)
    # @name = name
    # @descritpion = descritpion
    @paths = Hash.new
  end

  def computerWrite(words)
    words.each do |letter|
      puts letter
      sleep(0.09)
    end
  end


  def intro
    puts "Enter your name.."
    puts "</////>"
    @playerName = gets.chomp

    puts """ Welcome traveller you find yourself in a particularly  tricky situation people fuced you up and your all over the place"""

  end

  def add_path(pathhash)
    @paths.update(pathhash)
  end

  def go(pathname)
    return @paths[pathname]
  end


end

class Wilderness < Scene
  def initialize
    super("Wilderness", "Some Crazy shit goes on here ")
  end

  def enter
    puts self.description

    puts "what do you do?"

    response = gets.chomp

    if response.include?("north")
      return "Death"
    end

  end

end

class GroundZero < Scene

  def initialize
    super("GroundZero")

  end

  def enter

    puts @descritpion

    puts "What do you do "
    response = gets.chomp
    if response.include?("north")
      puts "A deeper Plot"
      response2  = gets.chomp
      if response2.include?("Run")
        return "Death"
      elsif response2.include?("Shoot")

        return "Death"
      elsif response2.include?("Pursuade")
        puts "He seems to have given you the advice you need "

        puts "You move on and find another place"
        return "Bunker"

      end



    end

  end


end

class BunkerHill < Scene

  def initialize
    super("BunkerHill", "Bunker on a hill")
  end

end
class Institute < Scene
  def initialize
    super("TheInstitute","the description")
  end
end


class NuclearShelter < Scene
  def initialize
    super("NuclearShelter", " Nuclear Shelter ... .Shits happening where do you wanna go north, south, east and west")
  end

  def enter
    puts @description
    puts "Where do you want to go?"
    puts ">///>"
    response = gets.chomp
    if response == "north"
      return "TheInstitute"
    elsif response == "south"
      return "Wilderness"

    elsif response == "east"
      return "BunkerHill"
    end

  end

end
class Finished < Scene

   def initialize
     super("Finished", "Congratulations you have finished")
  end

  def enter
    puts @description
    exit(0)
  end
end

class Death < Scene
  def initialize
    super("Death")
  end

  @@deatharray = ["You uncontrollably explode from your nooby ness, well done","I cant believe you died, you know my mother could do better than you"]
  def enter

    computerWrite(@@deatharray[rand(@@deatharray.length)])
    exit(0)
  end


end
class Map

  @@scenes = {"Institute" => Institute.new,
              "Bunker" => BunkerHill.new,
              "GroundZero" => GroundZero.new,
               "The Vault" => NuclearShelter.new,
               "Finished" => Finished.new,
               "Death" => Death.new
              }
  def initialize(os)
    @openingscene = @@scenes[os]
  end

  def opening_scene
    @openingscene.enter
  end

  def next_scene(scenename)
    scene = @@scenes[scenename]
    return scene.enter
  end
end
class Engine



end
