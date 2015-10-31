
class Scene
  @dir = ["north", "south","east","west"]

  def enter()
    puts "You have entered a scene which doesnt exist SOWWWWYYYYYY"


    exit(0)

  end
  def scoring(num)
    ewords = ["horray", "yippie","I am so happy for you", "Yay, children in africa are saved now", "Wooo", "OMG", "Im a computer, but I feel like screaming fuck yes right now"]
    $score += num
    random_word = ewords.at(rand(ewords.length - 1 ))
    speech "\n\t\t\tYou just got #{num} points!\n \t\t\tYour current score is #{$score} points..\n\t\t\t#{random_word}"
  end
  def rules()
    speech "PLAYER 1, please enter your name "
    input = STDIN.gets.chomp
    speech( "Welcome to eddys Alien Game, #{input}.\n")

    speech( "\nI dont have much time to explain but you are stranded on an alien ship you must get out somehow, someway.\n
    Move around the ship to find your way out \n but don\'t die you\'ll look like an idiot.\n")

    speech( "To move from place to place type in a direction like:\n\t
    north\tsouth\teast\t or west.\n simply say something like \'Head north and find me some chicken.. \'")
    speech("\n If you see an object type the name of the object like \'pick up the damm GUN bitchhh!  \'  ")
    sleep(4)
    speech "\nGet ready to start"
    sleep(4)
  end
end




class Central_Coridoor < Scene
  def enter

    rules()
    puts "\n"*3
    speech("\t\t\t\tCentral Corridor")
    puts "\n"
    speak ("""\tHello weary traveller, you find yourself battered and bruised in some kind of corridor,

      You see a rusty mace on the side of the Alien metal wall, it looks like it was straight out of Warhammer.

      The Corridor seems to head north you can hear something like people talking down there...

      What do you do ?
     """)
     prompt = ">>>   "
     puts prompt
     input = STDIN.gets.chomp

     if input.include?("north")
       stage
       puts "\n"
       scoring(1)
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
          scoring(2)
          speak( """
            The door actually leads to a ladder.

            NXT level

          """)
           return "Laser_Weapon_Armory"
        elsif input.include?("right")
          speak("""
          Well Well Well you greedy cheap fuck , the food was poison\n  """)
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

    speak ( "You crawl down the ladder and arrive in  the Laser Weapon Armory ")
    speak( """ The walls are full of Halo-esque and Call Of Duty like weaponry, you feel like you are in Big Daddy\'s hideaway from Kickass the movie
    There are 4 doors one is behind you, one is infront of you another is to your left and one to your right
    The doors dont seem to have any particular, impending death signs.


    However you seem gravitated towards an interesting Borderlands artifact there is a Rocket launcher on a stand in the middle
    of the Armory.

    """)

    puts ">"

    puts "what do you do ?...."
    input = STDIN.gets.chomp
    if input.include?("north")
      scoring(5)
      speak("""
      WOOOOOOOOOOOOOOOO

      """)
      return "Bonus_Room"
    elsif input.include?("south")
      speak("""


      """)


    else
      return "The_Bridge"
    end
 end

end

class The_Bridge < Scene
  def enter()
    speak ("WoW")
    return "Escape_Pod"
  end
end


class Escape_Pod < Scene
  def enter()
    speak("Finally")
    return "Finished"
  end
end

class Death < Scene
  @@deaths = ["You are so bad...my grandma could beat you to a pulp",
  "Well young padiwan, the force simply isnt with you",
  "Thora... is that you ? Never mind I thought you were so bad at Games you played like my Girlfriend",
  " Jesus is needed to save you from your terrible ability to play this game ",
  " Holy fucking shit,  I didnt think the world could suck any more now you had to play this game. "]

  def enter()
    speech("\n\t#{@@deaths.at(rand(@@deaths.length - 1 ))}")
    exit(0)
  end
end

class Finished < Scene
  def enter()
    speak ("CONGRATULATIONS YOU HAVE FINISHED THE GAME! YOU DONT SUCK! ")

    exit(0)
  end
end
