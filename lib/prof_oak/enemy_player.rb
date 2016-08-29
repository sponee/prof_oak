require 'gosu'

class EnemyPlayer < Player
  def initialize(window, x=1500, y=100)
    super
    @image = Gosu::Image.new('../assets/images/enemy_player.png')
  end

  def slide_on_screen
    @velocity_x += Gosu.offset_x(45, 1)
    @x -= @velocity_x if @x >= 750
  end

  def slide_off_screen
    @velocity_x += Gosu.offset_x(45, 1)
    @x += @velocity_x if @x >= -100
  end

  def off_screen?
    @x >= -99
  end
end