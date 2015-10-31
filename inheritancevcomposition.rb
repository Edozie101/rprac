class Parent
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

  def overrided
    puts "I am an overrided Child"
  end
  def altered
    puts "I am before Child altered "
    super()
    puts "I am after Child altered"

  end

end

p = Parent.new
c = Child.new

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
