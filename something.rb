module Something

  def implicit

    puts "I am somethings Implicit"

  end

  def overrided

    puts "I am an overrided"

  end

  def Something.altered
    puts "I am somethings altered"
  end
end
  class Child
    include Something
    def overrided
      puts "I am child overrided"
    end

    def altered
      puts "I am before child altered"
      Something.altered
      puts "I am after something altered"
    end
  end


# this is known as a mix in where you define a module  and include the modules functions
 # within a class... Here you can see we have overrided the classes functions with Child.overrided
# and we already "compose" implicit.

son = Child.new

son.implicit
son.overrided
son.altered


#RULES FOR INHERITANCE AND COMPOSTION
# 1: Avoid Meta Programming at all costs , as its too complex,
# To be used Reliably, if you're stuck with it then be prepared to know the class hierachy and
# Spend time determining where everything is coming from
# 2. Use composition to package up code in modules whre you can use MIXINS
# for convenient use in unrelated places and situations
# 3. Use inheriatance only when there is a clearly related
# reusable pieces of code that fit under a single common concept or if you
#  have to because of something you're using
#


#These are not hard and fast rules, OOP is entirely about social convention
# That is made to package and share code with other coders
# If you cannot do this because of working situations then you
# must find out how they use things and just adapt in the situation.
