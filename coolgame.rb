module Minigame

def Minigame.gold_room
  puts "This room is full of Gold how many pieces do you take "
  #prompt for user after asking the user a question of how much gold the player will take
  print ">"
  choice = $stdin.gets.chomp

  if choice.match(/[^0-9]/)
     # Minigame.dead will be defined later with more interesting printing
     Minigame.dead("Man learn how to type a binary number")
  else
    how_much = choice.to_i

    if how_much < 50
    puts "Nice you're not greedy you win!!!"
    exit(0)
    else
    Minigame.dead("you greedy bastard")
    end
  end
end

def Minigame.bear_room
  puts """
  There is a bear here
  the bear has lots of honey..
  the fat bear is infront of another door
  how are you going to move the bear ?
  """
  #define bear moved constant

  bear_moved = false

  #Minigame.start input loop for questions
  while true
    print "> "
    choice = $stdin.gets.chomp
    if choice == "take honey"
      Minigame.dead("The bear looks at you then slaps your face off and rips you open and eats your intestines for breakfast")
    elsif choice == "taunt bear" && !bear_moved     # only if the bear has not moved and you are taunting it

      puts "the bear has moved from the door. You can go through.."
      bear_moved = true
    elsif choice == "taunt bear" && bear_moved     # only if the bear has moved and you are taunting it
      Minigame.dead("The bear gets pissed off and chews your legs off then gouges your eyeballs out with its claw..... fuck ")
    elsif choice == "open door" && bear_moved     #only if the bear has moved and you say "open door"
      Minigame.gold_room
    else
      puts "I got no idea what that means, computer says no no"
    end
  end
end

def Minigame.ct_room
  puts """
  Here you see the great and evil Cthuluhu
  He, it, whatever ... stares at you and you go insane.
  Do you flee for your life or eat your head ?
  """

  print "> "

  choice = $stdin.gets.chomp

  if choice.include?("flee")
    Minigame.start
  elsif choice.include?("head")
    Minigame.dead("well that was tasty")
  else
    Minigame.ct_room
  end
end

def Minigame.dead why
  puts why, "Good Job!"
  exit(0)
end

def Minigame.start
  puts """
  You are in a dark room there is a door to your right and left
  which one do you take?
  """
  print "> "
  choice = $stdin.gets.chomp
  if choice == "right"
    Minigame.bear_room
  elsif choice == "left"
    Minigame.ct_room
  else
    Minigame.dead("You stumble around the room until you starve")
  end


end

end
