
class Scene
  def speak(words)
    puts words
    system "say", words

  end
  def rules;end
end

class Death < Scene

  def enter
    speak "Muahahahahahaahahha you get mutilated by Zombies"
  end

end

class Shopping_Centre < Scene
  def enter
    speak "Shoping Centre"
    speak """ You find yourself in a Shopping_Centre full of convenient and  friendly looking retail stores
    what do you do ? """

    input = STDIN.gets.chomp

    if input == "run"
      val = "Finished"
    end
    return val
  end
end
class Finished < Scene
  def enter
    speak "Congratulations traveller you have now escaped to the horrors , the Army has saved you ! "
  end
end

class Map
  @@scenes = {"Death" => Death.new,"Shopping_Centre" => Shopping_Centre.new,"Finished" => Finished.new}

  def initialize(scene_name)
    @opening_scene = scene_name
  end

  def opening_scene
    next_scene(@opening_scene)
  end

  def next_scene(name)
    scene = @@scenes[name]
    return scene
  end

end

class Engine
  def initialize(map)
    @map = map
    @final_scene = @map.next_scene("Finished")
    @current_scene = @map.opening_scene
  end

  def play

    while @current_scene != @final_scene

      #we want to return the next scene value
      #we also want to change current scene to the returned value of the current scene
      @current_scene = @current_scene.enter
      puts "#{@current_scene}"
      @current_scene = @map.next_scene(@current_scene)
      puts "#{@current_scene}"

    end
      #enter the final scene
      @current_scene.enter
  end



end

@fmap = Map.new("Shopping_Centre")
@fengine = Engine.new(@fmap)
@fengine.play
