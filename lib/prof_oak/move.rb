require_relative 'type_chart.rb'

class Move
  MAX_PP = 10
  DAMAGE = 10

  attr_accessor :pp
  attr_reader :type, :name, :max_pp

  def initialize(window)
    @name = "Tackle"
    @pp = @max_pp = MAX_PP
    @type = :normal
    @sound_effect = Gosu::Sample.new("../assets/sounds/tackle.wav")
  end

  def take_effect(player_pokemon, enemy_pokemon)
    enemy_pokemon.hp = enemy_pokemon.hp - (DAMAGE * ProfOak::TypeChart::NORMAL[enemy_pokemon.type])
    @sound_effect.play
    @pp -= 1
  end
end