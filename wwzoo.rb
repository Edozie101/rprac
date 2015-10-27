class Animal
end

#Dog is an Animal

class Dog < Animal

  def initialize(name)
    @name = name
  end
end

#Cat is an Animal
class Cat < Animal
  def initialize(name)
    @name = name

  end
end

#Person is_a? Object  True
class Person
  def initialize(name)
    @name = name
    @pet = nil
  end
  attr_accessor :pet
end

#Employee is a Person
class Employee < Person
    def initialize(name,salary)
      super(name)
      @salary = salary
    end
end

#Fish is an Animal

class Fish
end

#Salmon is a fish
class Salmon < Fish
  def initialize(name)
    @name = name
  end
end

# Halibut is a fish
class Halibut < Fish
  def initialize name
    @name = name
  end
end

#Set the rover variable to a new instance of Dog , give it a name Rover
rover = Dog.new("Rover")

#Set the rambo variable to a new instance of Dog , give it a name Rambo
rambo = Dog.new ("Rambo")

#Set the satan variable to a new instance of Cat , give it a name Satan
satan = Cat.new ("Satan")

#Set the mary variable to a new instance of Person, give it a name Mary
mary  = Person.new("Mary")

#Set the pet attribute of mary to the Cat object satan
mary.pet = satan

#Set the frank variable to a new instance of Employee with a name "frank" and a salary 120000
frank = Employee.new("Frank", 120000)

#Set the flipper variable to a new instance of Fish don't give it the name flipper because theres no name parrameter in the initialize function
flipper = Fish.new()

#Set the crouse variable to a new instance of the Salmon class give it the name crouse
crouse = Salmon.new("crouse")

#Set the harry variable to a new instance of the Halibut class give it the name harry
harry  = Halibut.new("harry")
