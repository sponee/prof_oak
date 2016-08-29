require 'gosu'
require_relative '../lib/prof_oak/player.rb'
require_relative '../lib/prof_oak/enemy_player.rb'
require_relative '../lib/prof_oak/text.rb'
require_relative '../lib/prof_oak/pokemon.rb'

class ProfOak < Gosu::Window
  WIDTH = 1280
  HEIGHT = 1200

  FONT_ASSETS = {
  font: "../assets/fonts/Pokemon_GB.ttf"
  }

  def initialize
    super WIDTH, HEIGHT 
    self.caption = "Prof. Oak"
    @start_image = Gosu::Image.new("../assets/images/intro.png")
    @battle_start_background = Gosu::Image.new("../assets/images/battle_start.png")
    @battle_background = Gosu::Image.new("../assets/images/battle_background.png")
    @intro_music = Gosu::Song.new("../assets/sounds/intro_theme.mp3")
    @intro_music.play(true)
    @player = Player.new(self, -500)
    @enemy_player = EnemyPlayer.new(self, 1500)
    @characters = [@player, @enemy_player]
    @font = Gosu::Font.new(self, FONT_ASSETS[:font], 50)
    @hp_font = Gosu::Font.new(self, FONT_ASSETS[:font], 40)
    @scene = :start
  end

  def initialize_game
    @scene = :pcs_on_screen
    @battle_music = Gosu::Song.new("../assets/sounds/battle_theme.mp3")
    @battle_music.play(true)
    @test_pokemon = Pokemon.new(self, 100, 460, "Persian")
    @second_test_pokemon = Pokemon.new(self, 740, 100, "Persian")
    @player.party << @test_pokemon
    @player.current_pokemon = @test_pokemon
    @enemy_player.party << @second_test_pokemon
    @enemy_player.current_pokemon = @second_test_pokemon
  end

  def initialize_both_pokemon_enter_battle
    @characters.each do |character|
      character.current_pokemon.play_battle_cry
    end
    @scene = :battle_menu
  end

  def draw
    case @scene
    when :start
      draw_start
    when :pcs_on_screen
      draw_pcs_on_screen
    when :pcs_off_screen
      draw_pcs_off_screen
    when :both_pokemon_enter_battle
      draw_both_pokemon_enter_battle
    when :battle_menu
      draw_battle_menu
    end
  end

  def update
    case @scene
    when :pcs_on_screen
      update_pcs_on_screen
    when :pcs_off_screen
      update_pcs_off_screen
    when :both_pokemon_enter_battle
      update_both_pokemon_enter_battle
    end
  end

  def button_down(id)
    case @scene
    when :start
      button_down_start(id)
    when :pcs_on_screen
      button_down_pcs_on_screen(id)
    end
  end

  def draw_start
    @start_image.draw(0,0,0)
  end

  def draw_pcs_on_screen
    @battle_start_background.draw(0, 0, 0)
    @enemy_player.draw
    @player.draw
    @font.draw("Prof. Oak wants to fight!",60,900,1,1,1,Gosu::Color::BLACK)
  end

  def draw_pcs_off_screen
    @battle_start_background.draw(0, 0, 0)
    @enemy_player.draw
    @player.draw
  end

  def draw_both_pokemon_enter_battle
    @battle_background.draw(0,0,0)
    @characters.each do |character|
      character.current_pokemon.draw
    end
  end

  def draw_battle_menu
    @battle_background.draw(0,0,0)
    @font.draw("#{@player.current_pokemon.name.upcase}",650,550,1,1,1,Gosu::Color::BLACK)
    @font.draw(":L #{@player.current_pokemon.level}",720,600,1,1,1,Gosu::Color::BLACK)
    @font.draw("#{@enemy_player.current_pokemon.hp} / #{@player.current_pokemon.max_hp}",650,680,1,1,1,Gosu::Color::BLACK)
    @font.draw("#{@enemy_player.current_pokemon.name.upcase}",150,50,1,1,1,Gosu::Color::BLACK)
    @font.draw(":L #{@enemy_player.current_pokemon.level}",220,100,1,1,1,Gosu::Color::BLACK)
    @hp_font.draw("HP: ",120,150,1,1,1,Gosu::Color::BLACK)
    @characters.each do |character|
      character.current_pokemon.draw
    end
  end

  def update_pcs_on_screen
    @characters.each do |character|
      character.slide_on_screen
    end
  end

  def update_pcs_off_screen
    @characters.each do |character|
      character.slide_off_screen
    end
    if @player.off_screen? && @enemy_player.off_screen?
      initialize_both_pokemon_enter_battle
    end
  end

  def button_down_pcs_on_screen(id)
    @scene = :pcs_off_screen
  end

  def button_down_start(id)
    @scene = :pcs_on_screen
    initialize_game
  end
end

window = ProfOak.new
window.show
