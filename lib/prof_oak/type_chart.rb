module ProfOak
  module TypeChart
    SUPER_EFFECTIVE = 1.5
    NEUTRAL = 1
    RESISTANT = 0.5
    NO_EFFECT = 0

    FIRE = { 
      :normal => NEUTRAL,
      :fire => RESISTANT, 
      :water => RESISTANT, 
      :electrict => NEUTRAL,
      :grass => SUPER_EFFECTIVE, 
      :ice => SUPER_EFFECTIVE,
      :poison => NEUTRAL,
      :ground => NEUTRAL,
      :flying => NEUTRAL,
      :psychic => NEUTRAL,
      :bug => SUPER_EFFECTIVE, 
      :rock => RESISTANT,
      :ghost => NEUTRAL,
      :dragon => RESISTANT,
      :dark => NEUTRAL, 
      :steel => SUPER_EFFECTIVE 
    }

    NORMAL = {
      :normal => NEUTRAL,
      :fire => NEUTRAL,
      :water => NEUTRAL,
      :electrict => NEUTRAL,
      :grass => NEUTRAL,
      :ice => NEUTRAL,
      :poison => NEUTRAL,
      :ground => NEUTRAL,
      :flying => NEUTRAL,
      :psychic => NEUTRAL,
      :bug => NEUTRAL,
      :rock => RESISTANT,
      :ghost => NO_EFFECT,
      :dragon => NEUTRAL,
      :dark => NEUTRAL,
      :steel => RESISTANT
    }
  end
end
