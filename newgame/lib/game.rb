class Scene
  attr_reader :name,:description,:paths
  def initialize(name,description)
    # @name = name
    # @descritpion = descritpion
    @paths = Hash.new
  end

  def add_path(pathhash)
    @paths.update(pathhash)
  end

  def go(pathname)
    return @paths[pathname]
  end

end

class NuclearShelter < Scene
  def enter
    return "You have entered into the Nuclear Shelter."
  end

end
