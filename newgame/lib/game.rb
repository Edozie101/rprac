require "./lib/game/lexicon.rb"

def computerWrite(words)
  @words = words.chars
  @words.each do |letter|
    print letter
    sleep(0.06)
  end
end

def competerSpeak(words)
  system("say", words)
  computerWrite(words)
end

class Npc
  attr_accessor :type, :name, :experience_value, :damage, :ranged,:health
  @@type_values = {
    "rat" => ["rat",33, 5, 0,20,rand(10)],
    "human_marauder" => ["human_marauder", 50,10,5,40,rand(10)]

  }
  def initialize(type)
    @type = type
    if @@type_values.has_key?(type)
      @name = @@type_values[type][0]
      @experience_value = @@type_values[type][1]
      @damage = @@type_values[type][2]
      @ranged = @@type_values[type][3]
      @health = @@type_values[type][4]
      @level = @@type_values[type][5]

    end
  end
end

class Monster < Npc
    attr_accessor :type, :name, :experience_value, :damage, :ranged
  def initialize(type)
    super(type)
  end



  def attack(player)
    computerWrite "#{@name} just attacked you for #{@damage} damage"
    puts player
    player.health -= @damage
    computerWrite "You have #{player.health} health left !"


  end

end


class Battle

  def initialize(monster,player)
    @monster = monster
    @player = player
  end

  def engage

    until @monster.health < 0 || @player.health < 0
      puts "*" * 40
      puts "*" * 40




      @monster.attack(@player)
      computerWrite "do you want to attack right now, or run ? \n "
      input = gets.chomp

      if input.include?("attack")
        @player.attack(@monster)

      elsif input.include?("run")
        runchance = @player.luck * rand(10)

        if runchance > 4
          computerWrite "You got away!"
          break
        elsif runchance <= 4
          computerWrite "The #{@monster.name} caught up to you! The fight continues!"
        end


      end

    end
    if @player.health != 0
      @player.add_exp(@monster)
      @player.update
    end
  end

end

class Player
  attr_accessor :name,:health,:strength,:perception,:endurance,:charisma,:intelligence, :agility, :luck, :level,:experience,:weapon
  def initialize(name)
    @name = name
    @strength = 1
    @perception = 1
    @endurance = 1
    @charisma = 1
    @intelligence = 1
    @agility = 1
    @luck = 1
    @level = 1
    @experience = 0
    @health  = 100
    @weapon = ["iron_sword",50,0]

  end

  def attack(monster)
    damage =  @weapon[1] * @strength
    monster.health -= damage
    computerWrite "You just attacked #{monster.name} for #{damage} damage"
    computerWrite "#{monster.name} has #{monster.health} health left!"

  end

  def add_exp(monster)
    @experience += monster.experience_value

  end

  def update
    if @experience.to_f / (@level * 200 ) == 1
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
  attr_accessor :name,:description,:paths,:intro
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
   def initialize(map)
     @@currentscene = map.openingscene
     @@lastscene = map.next_scene("Finished")
     @map = map
   end


   def play
     while @@currentscene != @@lastscene
       @@currentscene = @@currentscene.enter

       @@currentscene = @map.next_scene(@@currentscene)

     end

     @@currentscene.enter

   end

end
