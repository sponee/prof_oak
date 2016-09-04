require_relative 'type_chart.rb'

class Move
  MAX_PP = 10
  DAMAGE = 10

  attr_reader :type
  attr_reader :name
  attr_reader :max_pp
  attr_accessor :pp

  def initialize(window)
    @name = "Tackle"
    @pp = @max_pp = MAX_PP
    @type = :normal
  end

  def take_effect(player_pokemon, enemy_pokemon)
    enemy_pokemon.hp = enemy_pokemon.hp - (DAMAGE * ProfOak::TypeChart::Normal[enemy_pokemon.type])
    @pp -= 1
  end
end