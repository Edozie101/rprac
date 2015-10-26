require "./coolgame.rb"
$prompt= ">  "
def faiyl reason
  puts reason + "Good luck try again next time"
  exit(0)
end

def chemistry
  puts "\n"
  puts "*" * 48

  puts "Well done for choosing heisenburg"

end
def linguistics
  puts "\n" * 3
  puts "*" * 48

  puts "Well done for choosing the wonderful world of Linguistics and Languages "

  puts """
  You enter a room with 100 people standing in front  of you
  4 quiz buttons are there in front of you,
  A)____ B)____C)____D)____

  You brace for the worst...

  The first question comes out of a small speaker from the front room

  You are puzzuled as to why the question asker has not revealed him or herself

  but the voice sounds familiar..

  ..............................

  Voice :  \'Question number 1 ! \'
         \'What is the translation for \"intellectual\" in Icelandic\'
  You :  Holy fuck I know this one
  """
  no_1 = ["vitsmunalegum","menntamaður","snjall","You dunno"]

  for word in no_1
    puts """ #{(no_1.index(word) + 65).chr}) #{word} """
  end
  puts "What do you choose young padiwan? "

  $prompt

  answer = $stdin.gets.chomp

  if answer.match(/[aA]/)
    puts "Well done you can move onto the next question...."
  else
    faiyl("You got that wronggg try aginnn...")
  end

end

def start
  puts """

  _____    _          _      _       _____       _
|  ___|  | |        (_)    ( )     |  _  |     (_)
| |__  __| | ___ _____  ___|/ ___  | | | |_   _ _ ____
|  __|/ _` |/ _ \\_  / |/ _ \\ / __| | | | | | | | |_  /
| |__| (_| | (_) / /| |  __/ \\__ \\ \\ \\/' / |_| | |/ /
\\____/\\__,_|\\___/___|_|\\___| |___/  \\_/\\_\\__,_|_/___|



   """

   puts "*" * 45
   puts "\n" * 3
   puts "Welcome challenger, what is your name ?"

   name = $stdin.gets.chomp


  puts  """
    Welcome #{name} , you have enetered a Circular Lecture room
    on the chalk board you see the writing \'Choose your path, the journey
    may be perilous and you may return here many time but it will become your greatest
    accomplishment  \'

    Three doors are behind the chalk board...
    You can see notes written on an A4 piece of paper on each door.

    Door number 1 Says:
    Welcome to the wonderful world of Matter and Change as my good friend heisenburg used to say.

    Door number 2 Says:
    Welcome to the wonderful world of Numbers and Equations , the Queen of all the Sciences.

    Door number 3 Says:
    Welcome to the wonderful world of Linguistics and Languages, a way to understand the world.


    You are left with a choice.. Which do you choose ?

    """
    #$promptthe player to choose a door
    $prompt

    #get the door choice from STDIN
    door_choice = $stdin.gets.chomp


    #direct where to go dependent on door choice
    if door_choice.include?("3" || "three")
      linguistics()

    elsif door_choice.include?("2" || "Two")
      Minigame.start()
    elsif door_choice.include?("1" || "One")
      chemistry()
    else
      puts door_choice , door_choice.include?("3")

    faiyl "fuck you just cant choose out of threee doors ..... Goshhhh Im not gonna play with you any more.."
    end

end

start
