class Text
  SPEED = 1
  attr_reader :y

  def initialize(text, x, y)
    @x = x
    @y = @initial_y = y
    @text = text
    @font = Gosu::Font.new(240)
  end

  def move
    @y -= SPEED
  end

  def draw
    @font.draw(@text, @x, @y, 1)
  end

  def reset
    @y = @initial_y
  end
end