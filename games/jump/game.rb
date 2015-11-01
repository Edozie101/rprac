require 'gosu'

class Player
  def initialize
    #set the image for the player
    @image =  Gosu::Image.new("media/starfighter.bmp",:tilable => false)
    #IMPORTANT
    @x = @y = @velx = @vely = @angle =  0.0
    #keep track of the player scoer
    @score = 0
  end
  def warp x,y
    #teleport function moving player (x , y) to the input coordinates
    @x,@y = x,y
  end
  def turn_left
    #change the angle -4.5 to turn left
    @angle -= 4.5
  end
  def turn_right
    #change the angle +4.5 to turn right
    @angle += 4.5
  end
  def accelerate
    #increase the velocity by a factor
    #offset x takes an angle (theta) and a float , to return a float

    @velx += Gosu.offset_x(@angle,0.5)
    @vely += Gosu.offset_y(@angle,0.5)

    # the angle is the direction of the x and the float is the amount of pixels
    #moving in that direction
  end
  def move
    #Move the player by the velx
    @x += @velx
    #Move the player by the vely
    @y += @vely
    #set the distance of x and y to the modulus of  x and 640 , and y and 480 .
    # respectively , this is to make sure that when @x goes over or is 640
    # x returns to 0 and  is kept within the boundaries of the screen
    @x %= 640
    @y %= 480

    #decrease velx and vely by 0.95
    @velx *= 0.95
    @vely *= 0.95
  end
  def draw
    #draw the image with a rotation
    #draw_rot(x,y,z,angle[theta])
    @image.draw_rot(@x,@y,1,@angle)

    #draw_rot puts the centre of the image at @x,@y
    #Not the upper left corner like draw does
    #this can be controlled by center_x/center_y
  end
end

class Window < Gosu::Window
  def initialize
      super 640, 480
      self.caption = "Jump!"

      @background_image = Gosu::Image.new("space.jpg", :tileable => true)
      @player = Player.new
      @player.warp(320,240)
    end

    def update
      if Gosu::button_down? Gosu::kbLeft || Gosu::button_down? Gosu::gpLeft then
        @player.turn_left
      end
      #turn the player right if kb or gb right is true
      if Gosu::button_down?(Gosu::kbRight) or Gosu::button_down?(Gosu::gpRight) then
        @player.turn_right
      end
      #change the x and y coordinates
      if Gosu::button_down(Gosu::kbUp) or Gosu::button_down?(Gosu::gpButton0) then
        @player.accelerate
      end
      #translate the player by that amount of offset x and offset_y according to the angle
      #defined in the initial funcitons
      @player.move

    end

    def button_down id
      if id == Gosu::kbEscape
        close
      end 

    end

    def draw
      @background_image.draw(0,0,0)
      @player.draw
    end

end


g = Window.new
g.show
