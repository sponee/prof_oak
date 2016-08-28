require 'gosu'

class Player
  attr_accessor :party
  attr_accessor :current_pokemon
  attr_accessor :current_inventory
  attr_accessor :x
  attr_accessor :y

  def initialize(window, x=-100, y=460)
    @window = window
    @x = x
    @y = y
    @party = []
    @current_pokemon
    @inventory = 
    @velocity_x = 0
    @velocity_y = 0
    @image = Gosu::Image.new('../assets/images/player.png')
  end

  def draw
    @image.draw(@x, @y, 1)
  end

  def slide_on_screen
    @velocity_x += Gosu.offset_x(45, 1)
    @x += @velocity_x if @x <= 100
  end

  def slide_off_screen
    @velocity_x += Gosu.offset_x(45, 1)
    @x += @velocity_x if @x <= -100
  end

  def move
    @x += @velocity_x if @x <= 100
  end
end