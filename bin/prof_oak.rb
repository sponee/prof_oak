require 'gosu'
require_relative '../lib/prof_oak/player.rb'
require_relative '../lib/prof_oak/enemy_player.rb'
require_relative '../lib/prof_oak/text.rb'

class ProfOak < Gosu::Window
  WIDTH = 1280
  HEIGHT = 1200

  FONT_ASSETS = {
  font: "../assets/fonts/Pokemon_GB.ttf"
  }

  def initialize
    super WIDTH, HEIGHT 
    self.caption = "Prof. Oak"
    @start_music = Gosu::Song.new("../assets/sounds/battle_theme.mp3")
    @start_music.play(true)
    @background_image = Gosu::Image.new("../assets/images/battle_start_background.png", :tileable => true)
    @player = Player.new(self, -500)
    @enemy_player = EnemyPlayer.new(self, 1500)
    @characters = [@player, @enemy_player]
    @font = Gosu::Font.new(28)
    @font = Gosu::Font.new(self, FONT_ASSETS[:font], 50)
  end

  def update
    @characters.each do |character|
      character.slide_on_screen
    end
  end

  def draw
    @background_image.draw(0, 0, 0)
    @enemy_player.draw
    @player.draw
    @font.draw("Prof. Oak wants to fight!",60,900,1,1,1,Gosu::Color::BLACK)
  end
end

window = ProfOak.new
window.show
