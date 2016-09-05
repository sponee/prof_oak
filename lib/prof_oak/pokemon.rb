require_relative 'move.rb'

class Pokemon
  MAX_HP = 200
  attr_accessor :hp, :attack, :defense, :special_attack, :special_defense, :speed, :moves
  attr_reader :name, :level, :max_hp, :battle_cry, :type

  def initialize(window, x, y, name="Pokémon", level=35, friendly=true)
    @type = :normal
    @level = level
    @name = name
    @window = window
    @friendly = friendly
    @hp = @max_hp = MAX_HP
    @x = x
    @y = y
    @velocity_x = 0
    @velocity_y = 0
    @attack = 10
    @defense = 10
    @special_attack = 10
    @special_defense = 10
    @speed = 10
    @moves = [Move.new(@window)]
    @front_image = Gosu::Image.new("../assets/images/persian_front.png")
    @back_image = Gosu::Image.new("../assets/images/persian_back.png")
    @battle_cry = Gosu::Sample.new("../assets/sounds/persian.ogg")
  end

  def draw(side)
    if side == "front"
      @front_image.draw(@x, @y, 0)
    elsif side == "back"
      @back_image.draw(@x, @y, 0)
    end
  end

  def use_move(move, player_pokemon, enemy_pokemon)
    move.take_effect(player_pokemon, enemy_pokemon)
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

  def friendly?
    @friendly
  end

  def slide_on_screen_enemy
    @velocity_x += Gosu.offset_x(45, 1)
    @x -= @velocity_x if @x >= 850
  end

  def slide_off_screen_enemy
    @velocity_x += Gosu.offset_x(45, 1)
    @x -= @velocity_x if @x >= -500
  end

  def slide_on_screen_player
    @velocity_x += Gosu.offset_x(45, 1)
    @x += @velocity_x if @x <= 100
  end

  def slide_off_screen_player
    @velocity_x += Gosu.offset_x(45, 1)
    @x -= @velocity_x if @x >= -500
  end

  def onscreen_enemy?
    @x <= 850
  end

  def onscreen_player?
    @x >= 100
  end
end