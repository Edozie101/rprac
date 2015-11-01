require 'gosu'
module Zorder
  Background, Stars,Player,UI = *0..3
end
class Star

  attr_reader :x, :y
  def initialize animation
    @animation = animation
    # generate a random color for the star
    @color = Gosu::Color.new(0xff_000000)
    #keep the colors red , green, and blue a random value under 256
    @color.red = rand (256 - 40) + 40
    @color.green = rand(256 - 40) + 40
    @color.blue = rand(256 - 40) + 40
    #We have a x and y coordinate , for the stars
    @x = rand * 640
    @y = rand * 480
  end

  def draw
    img = @animation[Gosu::milliseconds / 100 % @animation.size]
    img.draw(@x - img.width / 2.0, @y - img.height / 2,Zorder::Stars,1,1,@color,:add )

  end

  #we dont want each and every star to load the animation again  we cant do this within the constructor
  #to show a different frame of the imgarray animation we modulo the time returned by Gosu::milliseconds / 100 by the length of the array

end
class Player
  include Zorder
  def initialize
    #set the image for the player
    @image =  Gosu::Image.new("media/starfighter.bmp",:tileable => false)
    @beep = Gosu::Sample.new("media/fizzle.wav")
    #IMPORTANT
    @x = @y = @velx = @vely = @angle =  0.0
    #keep track of the player scoer
    @score = 0
  end

  def score
    @score
  end
  def collect_stars(stars)
    #deleting the stars if the spaceship flies over
    stars.reject! do |star|
      # find the distance between two coordinates with Gosu Distance
      if Gosu::distance(@x,@y, star.x,star.y) < 35 then
        #add 10 to the score
        @score += 10
        #play the beep
        @beep.play
        true
      else
        #doesnt delete the star if its distance to the ship is greater than 35
        false
      end
    end
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
    @image.draw_rot(@x,@y,Player,@angle)

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
      #load tiles is the array of the animations
      @star_anim = Gosu::Image::load_tiles("media/star.png",25,25)
      @stars = Array.new

      @font = Gosu::Font.new(20)
    end

    def update
      # this function is made to update the player dependent on which buttons
      # are held down over frames
      if Gosu::button_down?(Gosu::KbLeft) or Gosu::button_down? Gosu::GpLeft then
        @player.turn_left
      end
      #turn the player right if kb or gb right is true
      if Gosu::button_down?(Gosu::KbRight) or Gosu::button_down?(Gosu::GpRight) then
        @player.turn_right
      end
      #change the x and y coordinates
      if Gosu::button_down?(Gosu::KbUp) or Gosu::button_down?(Gosu::GpButton0) then
        @player.accelerate
      end
      #translate the player by that amount of offset x and offset_y according to the angle
      #defined in the initial funcitons
      @player.move
      @player.collect_stars(@stars)

      if rand(100) < 4 and @stars.size < 25 then
        #pushes the new star with the animation array
        @stars.push (Star.new(@star_anim))
      end

    end

    def button_down id
      if id == Gosu::KbEscape
        close
      end

    end

    def draw
      @background_image.draw(0,0,Zorder::Background)

      @player.draw
      #from the collection of stars array select each Star object and call the draw function on the star
      @stars.each{|star| star.draw}
      #draw the score from the player object, then put the  x ,y z coordinates for the font,
      # then put the x size and y size, and the color
      @font.draw("Score: #{@player.score}", 10, 10, Zorder::UI,1.0,1.0,0xff_ffff00)
    end

end


g = Window.new
g.show
