require "./mdcsob.rb"
#modules are like hashes
Mystuff.apple()
puts Mystuff::TANGERINE


thing =  Mystuff::Mystuff.new
# :: Unary operator, to go access constants within the container

#Take a key value style contatiner
# get something out of it by the keys name


#Objects are like require once you instantiate the object from the class it gives you a bunch of methods you can do with the object
thing.apple



class Song
  def initialize(lyrics)
    @lyrics = lyrics
  end

  def sing
    @lyrics.each do |y|
      puts y
      sleep(1)
    end
  end
end

good_lyrics =  ["It\'s been one week since you looked at me",
"Cocked your head to the side and said, I\'m angry",
"Five days since you laughed at me saying",
"Get back together come back and see me",
"Three days since the living room",
"I realized it\'s all my fault, but couldn\'t tell you",
"Yesterday you\'d forgiven me",
"but it\'ll still be two days \'til I say I\'m sorry"]
one_week = Song.new(good_lyrics)

happy_bday = Song.new(["Happy birthday to you", "I don't want to get sued", "So I'll stop right there"])

bulls_on_parade = Song.new(["They rally around tha family",  "With pockets full of shells"])


happy_bday.sing
puts "_" * 40
puts "\n" * 3
bulls_on_parade.sing
puts "_" * 40
puts "\n" * 3
one_week.sing
