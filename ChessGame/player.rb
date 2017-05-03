require_relative 'display'

class HumanPlayer
  attr_accessor :name, :scores
  def initialize(name, display)
    @name = name
    @display = display
    @scores = 0
  end

  def take_turn
    Cursor.get_input
  end

end
