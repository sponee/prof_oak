class Pokemon
  MAX_HP = 200
  attr_accessor :hp
  attr_accessor :attack
  attr_accessor :defense
  attr_accessor :special_attack
  attr_accessor :special_defense
  attr_reader :name
  attr_reader :level
  attr_reader :max_hp

  def initialize(window, x, y, name="Pokémon", level=35)
    @level = level
    @name = name
    @window = window
    @hp = @max_hp = MAX_HP
    @x = x
    @y = y
    @attack = 10
    @defense = 10
    @special_attack = 10
    @special_defense = 10
    @moves = []
    @front_image = Gosu::Image.new("../assets/images/persian_front.png")
    @back_image = Gosu::Image.new("../assets/images/persian_back.png")
    @battle_cry = Gosu::Sample.new("../assets/sounds/persian.ogg")
  end

  def draw(side)
    if side == "front"
      @front_image.draw(@x, @y, 1)
    elsif side == "back"
      @back_image.draw(@x, @y, 1)
    end
  end

  def use_move(move, pokemon)
    move.use(pokemon)
  end

  def enter_battle
    play_battle_cry
  end

  def play_battle_cry
    @battle_cry.play(0.3)
  end

  def return_to_pokeball
  end

  def faint
  end

  def slide_on_screen
    @velocity_x += Gosu.offset_x(45, 1)
    @x += @velocity_x if @x <= 100
  end

  def slide_off_screen
    @velocity_x += Gosu.offset_x(45, 1)
    @x -= @velocity_x if @x >= -500
  end
end