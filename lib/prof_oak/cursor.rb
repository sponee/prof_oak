require 'gosu'

class Cursor
  attr_accessor :x
  attr_accessor :y
  attr_accessor :menu_selection_x
  attr_accessor :menu_selection_y

  def initialize(window, x=-100, y=460)
    @window = window
    @x = x
    @y = y
    @menu_selection_x = 1
    @menu_selection_y = 1
    @pos
    @image = Gosu::Image.new('../assets/images/cursor.png')
    @sound_effect = Gosu::Sample.new('../assets/sounds/cursor.wav')
  end

  def play_sound_effect
    @sound_effect.play
  end

  def draw
    @image.draw(@x, @y, 1)
  end

  def move_left
    if @menu_selection_x == 0
      @menu_selection_x += 1
      @x = 570
      self.play_sound_effect
    end
  end

  def move_right
    if @menu_selection_x == 1
      @menu_selection_x -= 1
      @x = 950
      self.play_sound_effect
    end
  end

  def move_up
    if @menu_selection_y == 0
      @menu_selection_y += 1
      @y = 920
      self.play_sound_effect
    end
  end

  def move_down
    if @menu_selection_y == 1
      @menu_selection_y -= 1
      @y = 1050
      self.play_sound_effect
    end
  end
end