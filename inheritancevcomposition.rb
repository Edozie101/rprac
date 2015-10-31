require 'something.rb'
class Parent
  attr_accessor(:height,:weight,:skin_color,:name)
  def initialize(name)
    @name = name
    @skin_color = "Brown"
  end
  def implicit
    puts "I am implicit Parent"
  end
  def overrided
    puts "I am an overrided Parent"
  end

  def altered
   puts " I am THE Parent altered"
  end

end

class Child < Parent
  attr_accessor(:height,:weight,:skin_color,:name)
  def initialize(name)
    super(name)
    @height = 183

  end

  def overrided
    puts "I am an overrided Child"
  end
  def altered
    puts "I am before Child altered "
    super()
    puts "I am after Child altered"

  end

end

p = Parent.new("Edozie")
c = Child.new("Jr")

puts(p.inspect)
sleep(1)
puts(c.inspect)
p.implicit
sleep(1)
c.implicit
sleep(1)
p.overrided
sleep(1)
c.overrided
sleep(1)
p.altered
sleep(1)
c.altered


#Here we can see in two of these examples we have to redefine the childs
# functions to avoid multiple inheritance issues

class Other
  def initialize
  end

  def implicit
    puts "Other implicit"

  end

  def overrided
    puts "Other overrided"

  end

  def altered
    puts "Other altered"

  end

end
class Mild
  def initialize
    @other = Other.new
  end
  def implicit
    @other.implicit
  end
  def overrided
    puts "Child overrided"
  end
  def altered
    puts "Before Child Altered "
    @other.altered
    puts "After Child Altered "
  end
end

# So within inheritance instead of the is_a? Relationship between Child and Parent
# The child  has_a? Other to get the same work done



m = Mild.new()
sleep 1
m.implicit
sleep 1
m.overrided
sleep 1
m.altered

# Afterwards I can ask myself well if Other is a class can't I create a module within
# Other.rb ? Yes you can
