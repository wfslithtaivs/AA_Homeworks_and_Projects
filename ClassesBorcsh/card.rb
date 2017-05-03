class Card
  attr_accessor :upcard, :value, :final

  def initialize(value)
    @upcard = false
    @value = value
    @final = false
  end

  def state
    @upcard
  end

  def hide
    @upcard = false
  end

  def reveal
    @upcard = true
  end

  def to_s
    @value.to_s
  end

  def set_final
    @final = true
  end  

  def final
    @final
  end

  def ==(other_card)
    other_card.is_a?(Card) && other_card.to_s == @value
  end

end
